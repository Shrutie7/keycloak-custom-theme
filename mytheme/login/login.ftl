<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
  

  
           
    <#if section = "header">
        ${msg("loginAccountTitle")}

    <#elseif section = "form">
    <div id="kc-form">

      <div id="kc-form-wrapper">
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <#if !usernameHidden??>
                    <div class="${properties.kcFormGroupClass!}">
                    <div class="kcdisplay">
                        <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>EmailId<#else>EmailId</#if></label>

                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" placeholder="Enter your emailId" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off"
                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                        />
</div>
                        <#if messagesPerField.existsError('username','password')>
                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                        </#if>

                    </div>
                </#if>

                <div class="${properties.kcFormGroupClass!}">
                <div class="kcdisplay">
                    <label for="password" class="${properties.kcLabelClass!}" onclick={togglePassword()}>${msg("password")}<img id="vi" src="${url.resourcesPath}/img/eye-off.png" class="imgp"></label>

                    <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" placeholder="Enter your password" autocomplete="off"
                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                    ></input>
</div>
                    <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                        <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </span>
                    </#if>
                   

                </div>






            
                             <div class="${properties.kcFormGroupClass!}">
                <div class="kcdisplay">
                <div class="captchaflex">

                <div id ="captchaimg">
               <img src = {} alt = "captchaimg" id="captchaim" height="100" width="200"/>
                </div>
                <img onclick={getcaptcha()} src ="${url.resourcesPath}/img/circular.png" alt="imgreset" height="20px" width="20px" class="imgreset" />
</div>
                    <label for="captcha" class="${properties.kcLabelClass!}">Captcha</label>

                    <input tabindex="3" id="captcha" class="${properties.kcInputClass!}" name="captcha" type="text" placeholder="Enter Captcha" autocomplete="off"
                           aria-invalid="<#if messagesPerField.existsError('username','password','captcha')>true</#if>"
                    />
</div>
                     <span id="input-error1" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                               
                        </span>

                </div>
             
                   
             

                  <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                      <input  type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                      <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="button" value="LOGIN"/>
                      <input tabindex="5" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="back" id="kc-back" type="button" value="BACK"/>
                  </div>
            </form>
        </#if>
        </div>
   
      
          <script >
          var decodedcaptcha;
                    var captchaid;
 let backbtn = document.getElementById("kc-back");
 backbtn.addEventListener("click", ()=>{
window.location.href = "${properties.initialuiLink}"
 });

         
          let btndoc=document.getElementById("kc-login");
 btndoc.addEventListener('click',()=>{
     let userenteredcaptcha=document.getElementById("captcha").value
    console.log("gjkgkjfgkf")
      console.log(decodedcaptcha,"===>")
      console.log(userenteredcaptcha,"===>user")
        let err=document.getElementById("input-error1")
        err.innerHTML="";
    if(decodedcaptcha===userenteredcaptcha){
      
   btndoc.type="submit";
          btndoc.click()
    }
    else{
     
        let err=document.getElementById("input-error1")
        err.innerHTML="Wrong Captcha Please Try Again";
        getcaptcha()
    }
    
 });

     
       
          console.log(document.getElementById('password'))
            function togglePassword() {
                var x = document.getElementById("password");
                var v = document.getElementById("vi");
                if (x.type === "password") {
                    x.type = "text";
                    v.src = "${url.resourcesPath}/img/eye.png";
                } else {
                    x.type = "password";
                    v.src = "${url.resourcesPath}/img/eye-off.png";
                }
            }
console.log("${properties.getcaptchaurl}")




         
     
document.addEventListener('load',getcaptcha())

           function getcaptcha (){
            fetch("${properties.getcaptchaurl}")
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(userData => {
   
    console.log('User Data:', userData);

  var imgx = document.getElementById("captchaim");
           imgx.src = 'data:image/png;base64,' +userData.data.captchaImage    
      let doc=document.getElementById("id-hidden-input")
           doc.value=userData.data.captchaId;
                 const base64String = userData.data.captchaEncoded; 
           const decodedString = atob(base64String);
                      decodedcaptcha=decodedString

           console.log(decodedString);
  })
  .catch(error => {
    console.error('Error:', error);
  });
           }
        </script>

    </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="6"
                                                 href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    <#elseif section = "socialProviders" >
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <hr/>
                <h4>${msg("identity-provider-login-label")}</h4>

                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <a id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                type="button" href="${p.loginUrl}">
                            <#if p.iconClasses?has_content>
                                <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                            <#else>
                                <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                            </#if>
                        </a>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
