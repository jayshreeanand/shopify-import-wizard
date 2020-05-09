$('.colorpicker').spectrum({
  type: "color",
  showPaletteOnly: "true",
  showInput: "true",
  showInitial: "true",
});

$(".color-picker").spectrum({
  type: "color",
  hideAfterPaletteSelect: "true",
  showInput: "true",
  showInitial: "true",
  // change: function(color) {
  //   alert(color.toHexString()); // #ff0000
  // }
});



var defaultContent = JSON.parse('{"message":"This website uses cookies to ensure you get the best experience on our website.","dismiss":"Got it!","link":"Learn More","href":"https://geeky-design.myshopify.com/policies/privacy-policy"}');

var bindings = {
  "bar-message":           { selector: ".preview-bar-message span", type: 'text', default: defaultContent["message"]},
  "bar-button-text":       { selector: ".preview-bar-button", type: 'text', default: defaultContent["dismiss"]},
  "bar-privacy-link-text": { selector: "a.preview-privacy-link", type: 'text', default: defaultContent["link"]},
  "bar-privacy-link":      { selector: "a.preview-privacy-link", type: 'href'},
  "color-banner":          { selector: ".preview-cookie-bar", type: 'style', prop: 'background-color', default: '#000'},
  "color-banner-text":     { selector: ".preview-cookie-bar", type: 'style', prop: 'color', default: '#fff'},
  "color-banner-link":     { selector: "a.privacy-link", type: 'style', prop: 'color', default: '#fff'},
  "color-button":          { selector: ".preview-bar-button", type: 'style', prop: 'color', default: '#f8e71c'},
  "color-button-text":     { selector: ".preview-bar-button", type: 'style', prop: 'background-color', default: '#0000'},
  "color-button-border":   { selector: ".preview-bar-button", type: 'style', prop: 'border-color', default: '#f8e71c'}
}

function initPreviewBindings()  {
  Object.keys(bindings).forEach(function(key,index)  {
    //Bind inputs to preview elements
    $(document).on('keyup change','#' + key, function() {
      var binding   = bindings[key];
      var b_type    = binding.type;
      var unit      = binding.unit || '';
      var selected  = $(binding.selector);
      var new_value = $(this).val();
      // Extract elements filtered by containerClass as query context
      if (b_type == "text"){
        if(new_value.length <= 0){
          if(binding.default) new_value = binding.default;
        }
        selected.text(new_value);
      }
      if (b_type == "style"){
        if(unit && new_value.length <= 0){
          if(binding.default){
            new_value = binding.default;
          } else {
            new_value = 0;
          }
        };
        selected.css(binding.prop, new_value+unit);
      }
      if (b_type == "href"){ selected.attr('href', new_value) }
    });
  });
  //Trigger changes to set initial state
  Object.keys(bindings).forEach(function(key) {   $('#' + key).trigger('change') })
}

initPreviewBindings();
setTimeout(function(){
  $('div.preview-cookie-bar-holder').fadeIn(); // load styles first before showing preview
}, 100);
