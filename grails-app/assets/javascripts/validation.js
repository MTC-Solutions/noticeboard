$(function () {
    $.validator.setDefaults({
        errorClass:"invalid-feedback",
        highlight:function (element) {
            $(element).closest(".form-control").addClass('is-invalid')
        },
        unhighlight:function (element) {
            $(element).closest(".form-control").removeClass('is-invalid')
        },
        success:function (element) {
            $(element).closest(".form-control").addClass('is-valid')
        }

    });

    $(".form-validation").validate({
        rules:{
            username:{
                required:true,
                email:true
            },
            currentPassword:{
                required:true
            },

            newPassword:{
                required:true
            },

            password:{
                required:true
            },

            confirmPassword:{
                required:true,
                equalTo:"#new-password"
            },

            name:{
                required:true
            },

            country:{
                required:true
            },

            address:{
                required:true
            },

            city:{
                required:true
            },

            postalCode:{
                required:true
            },

            email:{
                required:true,
                email:true
            },
            phoneNumber:{
                required:true
            },

            //instructor, student, admin any person
            title:{
                required:true,
                maxLength:5
            },
            firstName:{
                required:true,
                minLength:2
            },
            middleName:{
                required:true,
                minLength:2
            },
            lastName:{
                required:true,
                minLength:2
            },
            studentNumber:{
                required:true,
                minLength:2
            }
        },
        messages:{
            username:{
                required:"Please enter your email address",
                email:"Please provide a <em>valid</em> email address, username is an email address."
            },
            currentPassword:{
                required:"Please enter your <em>current password</em>."
            },
            newPassword:{
                required:"Please enter your <em>new password</em>."
            },
            confirmPassword:{
                required:"Please enter your <em>confirm password</em>.",
                equalTo:"Confirm password don't match new password."
            },
            name:{
                required:"Please provide your <em>name</em>."
            },

            country:{
                required:"Please provide your <em>country</em>."
            },

            address:{
                required:"Please provide your <em>address</em>."
            },

            city:{
                required:"Please provide your <em>city</em>."
            },

            postalCode:{
                required:"Please provide your <em>postal code</em>."
            },

            email:{
                required:"Please provide your <em>email</em>.",
                email:"Please provide a <em>valid</em> email address."
            },
            phoneNumber:{
                required:"Please provide your <em>phone number</em>."
            }
        }
    })
});