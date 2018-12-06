$(document).ready(function(){
  var body = document.getElementsByClassName('show admin_activities');
  if (body[0]) {
    var row_content = body[0].getElementsByClassName('row-content');
    var td = row_content[0].getElementsByTagName("td")[0]
    var content = td.innerHTML;
    
    var obj = JSON.parse(content);
    var html_content = quillGetHTML(obj)
    td.innerHTML = html_content
  }

  form = $('form.activity')
  if(form.length) {
    $("input[name='activity[image]']").change(function() {
      validateSize(this);
    });

    action_buttons = $('fieldset.actions')
    form.append(action_buttons);

    setToolbarToActivityContents();
  }

});

function validateSize(file) {
  var FileSize = file.files[0].size / 1024 / 1024;
  if (FileSize > 2) {
      alert('A imagem deve ser menor que 2MB. Selecione outra imagem.');
     $(file).val('');
  }
}

function add_fields(link, association, content, father) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  content = content.replace(regexp, new_id)
  regexp = new RegExp("NEW_RECORD_ID", "g");
  content = content.replace(regexp, new_id)
  $('li.activity_content_blocks').append(content)

  // INITIALIZE QUILL EDITOR 
  editor = $(`#activity_activity_content_blocks_attributes_${new_id}_body.quill-editor`)
  if (editor.length) {
    initializeQuillEditor(editor[0])
    content = editor[0].querySelector(".quill-editor-content");
    toolbar = $(`#toolbar_${new_id}`)
    if (toolbar.length) {
      editor[0].insertBefore(toolbar[0], content)
    }
  }

  convertAllEditorsToDelta();

  goToTop($(content).offset().top)

  return false;
};

function setToolbarToActivityContents(){
  var editors = document.querySelectorAll( '.quill-editor' );
  for( var i = 0; i < editors.length; i++ ) {
    content = editors[i].querySelector(".quill-editor-content");
    div_parent = content.parentElement;
    toolbar_options = JSON.parse(div_parent.dataset.options);
    toolbar_id = toolbar_options.modules.toolbar;
    toolbar = $(toolbar_id);
    editors[i].insertBefore(toolbar[0], content);
  }
}

function goToTop(offset) {
  setTimeout(function() {
    $("html, body").animate({ scrollTop: offset }, 1000);
  }, 400);
}