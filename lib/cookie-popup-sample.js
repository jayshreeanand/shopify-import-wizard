'use strict';

(function () {
  function getUrlParam(paramName) {
    var params = {};
    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str,key,value) {
      params[key] = value;
    });
    return params[paramName];
  }

  var return_url  = getUrlParam('ba_return_url');
  var popup_message = '<div id="booster-preview-popup" data-popup="true" style="font-family: arial; display: block; position: fixed; left: 0px; right: 0px; top: 0px; height: 0px; text-align: center; z-index: 99999999999;"> <style type="text/css"> .__selector-picker-btn:hover{background:#e6e6e6!important;border-color:#adadad!important;}</style> <div style="display: inline-block;margin-top: 0px;min-width: 500px;padding: 12px;background: #286ef8;color: #fff;text-align: center;font-size: 15px;border-radius: 0 0 2px 2px;border: #eee;border-top: 0;box-shadow: 0 1px 5px 0 rgba(0,0,0,0.4);font-weight: 500;"><span style="display:block;font-size:12px;padding-bottom:3px;">*Only you will see this message during testing</span><p style="white-space: pre-line;color:#fff;">--MESSAGE--</p> <button id="ba_preview_btn_continue" class="__selector-picker-btn" data-popup="save" style="display: --DISPLAY--; font-size:14px;margin-left:auto; font-family: arial; margin-right: auto;color:#333;background:#fff;border:1px solid #ccc;border-radius:4px;line-height:32px;padding:0 12px" type="button">Continue back to the App</button> </div></div>';

  var message  = "Awesome! The cookie bar is appearing on your store for EU customers. Let's continue back to the app";

  popup_message = popup_message.replace('--MESSAGE--',message).split("+").join(" ");
  popup_message = popup_message.replace('--DISPLAY--','block');

  var parent       = document.createElement('div');
  parent.innerHTML = popup_message
  var popup        = parent.firstChild;
  document.body.appendChild(popup);

  document.getElementById("ba_preview_btn_continue").addEventListener("click", function(e){
    e.stopPropagation();
    e.preventDefault();
    window.location = decodeURIComponent(return_url) //+ '&preview_result=success'
  });
})();