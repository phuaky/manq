$(document).ready(function (){
  $('#biz_user_registration').form({
    inline: true,
    on: 'blur',
    fields: {
      email:  { identifier: 'registered_user[email]',
                                rules:  [{  type: 'empty',
                                            prompt: 'Field must not be empty'},
                                          { type: 'email',
                                            prompt: 'Please enter a valid email'}]
              },
      password: { identifier: 'registered_user[password]',
                                rules:  [{  type: 'empty',
                                            prompt: 'Field must not be empty'},
                                          { type: 'minLength[8]',
                                            prompt: 'Your password must be at least {ruleValue} characters'},
                                          { type: 'maxLength[72]',
                                            prompt: 'Your superhuman memory is noted, but passwords cannot exceed {ruleValue} characters'}]
                },
      password_confirmation:  { identifier: 'registered_user[password_confirmation]',
                                rules:  [{  type: 'empty',
                                            prompt: 'Field must not be empty'},
                                          { type: 'minLength[8]',
                                            prompt: 'Your password must be at least {ruleValue} characters'}]
                              },
      company_name: { identifier: 'biz_user[company_name]',
                                rules:  [{  type: 'empty',
                                            prompt: 'Field must not be empty'}]
                    },
      business_registration_number: { identifier: 'biz_user[reg_no]',
                                rules:  [{  type: 'empty',
                                            prompt: 'Field must not be empty'}]
                                    },
      company_address:{ identifier: 'biz_user[address]',
                                rules:  [{  type: 'empty',
                                            prompt: 'Field must not be empty'}]
                      },
      contact_person: { identifier: 'biz_user[contact_person]',
                                rules:  [{  type: 'empty',
                                            prompt: 'Field must not be empty'}]
                      },
      contact_no: { identifier: 'biz_user[contact_no]',
                                rules:  [{  type: 'integer',
                                            prompt: 'Please enter only numbers'},
                                          { type: 'regExp[/^(8|9)\\d{7}$/]',
                                            prompt: 'Please enter a valid Singapore mobile number without country code'}]
                  }
    }
  });


  $('#store-details').form({
    inline: true,
    on: 'blur',
    fields: {
      store_name:  { identifier: 'store[store_name]',
                                rules:  [{  type: 'empty',
                                            prompt: 'Field must not be empty'}]
              },
      store_address: { identifier: 'store[store_address]',
                                rules:  [{  type: 'empty',
                                            prompt: 'Field must not be empty'}]
                },
      contact_person:  { identifier: 'store[contact_person]',
                                rules:  [{  type: 'empty',
                                            prompt: 'Field must not be empty'}]
                              },
      contact_no: { identifier: 'store[contact_no]',
                                rules:  [{  type: 'integer',
                                            prompt: 'Please enter only numbers'},
                                          { type: 'regExp[/^(8|9)\\d{7}$/]',
                                            prompt: 'Please enter a valid Singapore mobile number without country code'}]
                    },
      max_queue_no: { identifier: 'store[max_queue_no]',
                                rules:  [{  type: 'integer',
                                            prompt: 'Please enter only numbers'}]
                                    },
      max_queue_allow: { identifier: 'store[max_queue_allow]',
                                rules:  [{  type: 'integer',
                                            prompt: 'Please enter only numbers'}]
                                    },
      max_leeway:{ identifier: 'store[max_leeway]',
                                rules:  [{  type: 'integer',
                                            prompt: 'Please enter only numbers'}]
                      },
      reservation_fee: { identifier: 'store[reservation_fee]',
                                rules:  [{  type: 'decimal',
                                            prompt: 'Please enter a valid decimal number'}]
                      }
      }
  });



  $('#new-store-details').form({
    inline: true,
    on: 'blur',
    fields: {
      email:  { identifier: 'registered_user[email]',
                                rules:  [{  type: 'empty',
                                            prompt: 'Field must not be empty'},
                                          { type: 'email',
                                            prompt: 'Please enter a valid email'}]
              },
      password: { identifier: 'registered_user[password]',
                                rules:  [{  type: 'empty',
                                            prompt: 'Field must not be empty'},
                                          { type: 'minLength[8]',
                                            prompt: 'Your password must be at least {ruleValue} characters'},
                                          { type: 'maxLength[72]',
                                            prompt: 'Your superhuman memory is noted, but passwords cannot exceed {ruleValue} characters'}]
                },
      password_confirmation:  { identifier: 'registered_user[password_confirmation]',
                                rules:  [{  type: 'empty',
                                            prompt: 'Field must not be empty'},
                                          { type: 'minLength[8]',
                                            prompt: 'Your password must be at least {ruleValue} characters'}]
                              },
      store_name:  { identifier: 'store[store_name]',
                                rules:  [{  type: 'empty',
                                            prompt: 'Field must not be empty'}]
              },
      store_address: { identifier: 'store[store_address]',
                                rules:  [{  type: 'empty',
                                            prompt: 'Field must not be empty'}]
                },
      contact_person:  { identifier: 'store[contact_person]',
                                rules:  [{  type: 'empty',
                                            prompt: 'Field must not be empty'}]
                              },
      contact_no: { identifier: 'store[contact_no]',
                                rules:  [{  type: 'integer',
                                            prompt: 'Please enter only numbers'},
                                          { type: 'regExp[/^(8|9)\\d{7}$/]',
                                            prompt: 'Please enter a valid Singapore mobile number without country code'}]
                    },
      max_queue_no: { identifier: 'store[max_queue_no]',
                                rules:  [{  type: 'integer',
                                            prompt: 'Please enter only numbers'}]
                                    },
      max_queue_allow: { identifier: 'store[max_queue_allow]',
                                rules:  [{  type: 'integer',
                                            prompt: 'Please enter only numbers'}]
                                    },
      max_leeway:{ identifier: 'store[max_leeway]',
                                rules:  [{  type: 'integer',
                                            prompt: 'Please enter only numbers'}]
                      },
      reservation_fee: { identifier: 'store[reservation_fee]',
                                rules:  [{  type: 'decimal',
                                            prompt: 'Please enter a valid decimal number'}]
                      }
      }
  });



});
