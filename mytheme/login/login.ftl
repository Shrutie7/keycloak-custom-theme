<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
  

  
             <script>
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

            var image = new Image(200,70);
            image.src = 'data:image/png;base64,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';
            var imgreset = new Image(20,20);
            imgreset.src = "${url.resourcesPath}/img/circular.png"
            document.getElementById("captchaimg")?.appendChild(image);
        
        </script>
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
               
                </div>
                <img src ="${url.resourcesPath}/img/circular.png" alt="imgreset" height="20px" width="20px" class="imgreset"/>
</div>
                    <label for="captcha" class="${properties.kcLabelClass!}">Captcha</label>

                    <input tabindex="3" id="captcha" class="${properties.kcInputClass!}" name="captcha" type="text" placeholder="Enter Captcha" autocomplete="off"
                           aria-invalid="<#if messagesPerField.existsError('username','password','captcha')>true</#if>"
                    />
</div>
                    <#if usernameHidden?? && messagesPerField.existsError('username','password','captcha')>
                        <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </span>
                    </#if>

                </div>

                  <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                      <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                      <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="LOGIN"/>
                  </div>
            </form>
        </#if>
        </div>

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
