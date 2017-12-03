jQuery(function(){
    tinymce_global_settings["settings"].push(my_custom_function);
});
function my_custom_function(custom_settings, def_settings){
    def_settings['plugins'] += " codesample fullscreen";
    def_settings['toolbar'] += " codesample fullscreen";
    def_settings['codesample_languages'] = [
        {text: 'Ruby', value: 'ruby'},
        {text: 'Swift', value: 'swift'},
        {text: 'HTML/XML', value: 'markup'},
        {text: 'JavaScript', value: 'javascript'},
        {text: 'CSS', value: 'css'},
        {text: 'Python', value: 'python'},
        {text: 'Java', value: 'java'},
        {text: 'C', value: 'c'},
        {text: 'C#', value: 'csharp'},
        {text: 'C++', value: 'cpp'}
    ];
    def_settings['templates'] = def_settings['templates'] || [];
    def_settings['templates'].push({title: 'Will Template', description: 'This is a Will template', content: '<div class="mceTmpl"><h1>Title Template</h1><div>body template</div></div>'});
}