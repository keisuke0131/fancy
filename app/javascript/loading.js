let bg = document.getElementById('loader-bg');
let loader = document.getElementById('loader');
      /* ロード画面の非表示を解除 */


/* 読み込み完了 */
window.addEventListener('load', stopload);
setTimeout('stopload()',10000);

      /* ロード画面を非表示にする処理 */
function stopload(){
    bg.classList.add('fadeout-bg');
    loader.classList.add('fadeout-loader');
}