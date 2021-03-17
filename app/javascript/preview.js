if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
   
    const ImageWidth = 500;
    const ImageHeight = 500; 

  $('input[type=file]').change(function() {

    // ファイルを取得
    file = $(this).prop('files')[0];
    // 選択されたファイルが画像かどうか判定
    if (file.type != 'image/jpeg' && file.type != 'image/png') {
      // 画像でない場合は終了
      file = null;
      blob = null;
      return;
    }

    // 画像をリサイズする
    const image = new Image();
    const reader = new FileReader();
    reader.onload = function(e) {
      image.onload = function() {
        let width, height;
        if(image.width > image.height){
          // 横長の画像は横のサイズを指定値にあわせる
          const ratio = image.height/image.width;
          width = ImageWidth;
          height = ImageWidth * ratio;
        } else {
          //縦長の画像は縦のサイズを指定値に合わせる
          const ratio = image.width/image.height;
          width = ImageHeight * ratio;
          height = ImageHeight;
        }
        // サムネ描画用canvasのサイズを上で算出した値に変更
        const canvas = $('#canvas')
                        .attr('width', width)
                        .attr('height', height);
        const ctx = canvas[0].getContext('2d');
        //canvasに既に描画されている画像をクリア
        ctx.clearRect(0,0,width,height);
        //canvasにサムネイルを描画
        ctx.drawImage(image,0,0,image.width,image.height,0,0,width,height);
        
        //canvasからbase64画像データを取得
        const base64 = canvas.get(0).toDataURL('image/jpeg');
        //base64からblobを作成
        let barr, bin, i, len;
        bin = atob(base64.split('base64,')[1]);
        len = bin.length;
        barr = new Uint8Array(len);
        i = 0;
        while (i < len) {
          barr[i] = bin.charCodeAt(i);
          i++;
        }
        blob = new Blob([barr], {type: 'image/jpeg'});
        
      }
      image.src = e.target.result;
    }
    reader.readAsDataURL(file);
  })
  
    
    document.getElementById('item-image').addEventListener('change', function(e){
      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }

     
    });
  });
}
