if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){ //newとeditのページのときのみ実行される
  document.addEventListener('DOMContentLoaded', function(){
    const imageList = document.getElementById('image-list');

    //選択した画像を表示する関数
    const createImageHTML = (blob) => {

      //画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      //表示する画像(img要素)を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      //生成した画像の大きさの指定
      blobImage.onload = function(){
        orgWidth = blobImage.width;
        orgHeight = blobImage.height;
        blobImage.height = 100;
        blobImage.width = orgWidth * (blobImage.height / orgHeight);
      };
      //生成したHTML要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      imageList.appendChild(imageElement);
    };

    document.getElementById('item-image').addEventListener('change', function(e){
      //画像が表示されている場合のみ既に存在している画像を削除する
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      };
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}