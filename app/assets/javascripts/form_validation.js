$(document).ready(function (){
  $('#biz_user_registration').form({
    inline: true,
    on: 'blur',
    fields: {
      registered_user[email]: { identifier: 'registered_user[email]',
                                rules: [{ type: 'empty',
                                          prompt: 'Please enter a value'}]
                              }
    }
  });
});
