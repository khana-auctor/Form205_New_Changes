var allowWindowClose = false;

if (sessionStorage.getItem('ALLOW_WINDOW_CLOSE') === '1') {
    allowWindowClose = true;

}

(function hookPostBackWhenReady() {
    if (typeof window.__doPostBack === 'function') {

        if (window.__doPostBack.__wrappedForClose === true) return;

        var originalPostBack = window.__doPostBack;

        function wrappedPostBack(eventTarget, eventArgument) {
            if (eventTarget === 'UCSubmit1$ReviewAction') {
                allowWindowClose = true;
                sessionStorage.setItem('ALLOW_WINDOW_CLOSE', '1');
            }
            return originalPostBack.apply(this, arguments);
        }

        wrappedPostBack.__wrappedForClose = true;
        window.__doPostBack = wrappedPostBack;
        return;
    }

    setTimeout(hookPostBackWhenReady, 25);
})();


/* ============================================================
   ARM CLOSE FOR REVIEW ACTION (REAL SUBMIT TRIGGER)
============================================================ */
document.addEventListener('change', function (event) {
    var el = event.target;
    if (!el) return;

    if (el.id === 'UCSubmit1_ReviewAction') {
        allowWindowClose = true;
    }
}, true);

/* ============================================================
   ARM CLOSE FOR SUBMIT BUTTONS
============================================================ */
document.addEventListener('mousedown', function myMouseClick(event) {

    var target = event.target || event.srcElement;
    if (!target) return;

    var d = $(target);
    var name = d.prop("id") || "";

    if (name.length >= 2) {
        var mystr = name.substring(0, 2);
        if (mystr !== "UC" && target.tagName !== "SELECT") {
            var mouseLoc = document.getElementById("mouseLoc");
            if (mouseLoc) mouseLoc.value = name;
        }
    }

    var el = target;
    while (el && el !== document) {
        if (el.tagName === "INPUT" && el.type === "submit") {
            allowWindowClose = true;
            console.log("allowWindowClose armed by submit click:", el.id);
            break;
        }
        el = el.parentNode;
    }
}, true);

// ===============================
// (Overwriting onload breaks WebForms MaintainScrollPositionOnPostback)
// ===============================
function DisableBackButton() {
    try { window.history.forward(); } catch (e) { }
}

// Run once immediately
DisableBackButton();

// ✅ Preserve existing WebForms/ScriptManager onload handlers
window.addEventListener('load', DisableBackButton);

// Preserve your bfcache behavior
window.addEventListener('pageshow', function (evt) {
    if (evt && evt.persisted) DisableBackButton();
});

// (Optional) Keep if you want; not required
window.addEventListener('unload', function () { });


// Generic server message popup (same style as showSubmitPopup)
function ShowMessage(message, onOk) {
    if (!message) return;

    // Remove existing popup
    var old = document.getElementById('msgOverlay');
    if (old && old.parentNode) old.parentNode.removeChild(old);

    var raw = String(message);

    // Convert literal \n if present
    if (raw.indexOf('\\n') !== -1) raw = raw.split('\\n').join('\n');
    if (raw.indexOf('\\r') !== -1) raw = raw.split('\\r').join('');

    raw = raw.replace(/\r\n/g, '\n').replace(/\r/g, '\n').replace(/\s+$/, '');

    var lines = raw.split('\n')
        .map(function (s) { return s.trim(); })
        .filter(function (s) { return s.length > 0; });

    // ================= Overlay =================
    var overlay = document.createElement('div');
    overlay.id = 'msgOverlay';
    overlay.style.position = 'fixed';
    overlay.style.top = 0;
    overlay.style.left = 0;
    overlay.style.width = '100%';
    overlay.style.height = '100%';
    overlay.style.backgroundColor = 'rgba(0,0,0,0.7)';
    overlay.style.zIndex = 9999;
    overlay.style.display = 'flex';
    overlay.style.alignItems = 'center';
    overlay.style.justifyContent = 'center';
    overlay.style.padding = '20px';
    overlay.style.boxSizing = 'border-box';
    overlay.style.overflowY = 'auto';

    // ================= Popup =================
    var popup = document.createElement('div');
    popup.style.backgroundColor = '#fff';
    popup.style.borderRadius = '4px';
    popup.style.boxShadow = '0 0 10px #000';
    popup.style.fontFamily = 'Arial, Helvetica, sans-serif';
    popup.style.fontSize = '13px';
    popup.style.lineHeight = '1.4';
    popup.style.boxSizing = 'border-box';

    // ================= SINGLE LINE =================
    if (lines.length <= 1) {

        popup.style.padding = '20px 30px';
        popup.style.minWidth = '250px';
        popup.style.maxWidth = '90%';
        popup.style.textAlign = 'center';

        var msg = document.createElement('div');
        msg.textContent = lines[0] || '';
        msg.style.marginBottom = '15px';
        popup.appendChild(msg);

        var okBtn = document.createElement('button');
        okBtn.innerText = 'OK';
        okBtn.style.padding = '6px 18px';
        okBtn.style.cursor = 'pointer';

        okBtn.onclick = function () {
            if (overlay.parentNode) overlay.parentNode.removeChild(overlay);
            if (typeof onOk === 'function') {
                try { onOk(); } catch (ex) { }
            }
        };

        popup.appendChild(okBtn);
    }

    // ================= MULTI LINE =================
    else {

        popup.style.width = '100%';
        popup.style.maxWidth = '650px';
        popup.style.maxHeight = 'calc(100vh - 40px)';
        popup.style.display = 'flex';
        popup.style.flexDirection = 'column';
        popup.style.overflow = 'hidden';

        var body = document.createElement('div');
        body.style.padding = '20px 24px 12px 24px';
        body.style.flex = '1 1 auto';
        body.style.overflowY = 'auto';
        body.style.textAlign = 'left';

        var title = document.createElement('div');
        title.textContent = lines.shift();
        title.style.marginBottom = '12px';
        title.style.fontWeight = 'bold';
        body.appendChild(title);

        var ul = document.createElement('ul');
        ul.style.margin = '0';
        ul.style.paddingLeft = '20px';

        lines.forEach(function (text) {
            var li = document.createElement('li');
            li.textContent = text;
            li.style.marginBottom = '4px';
            ul.appendChild(li);
        });

        body.appendChild(ul);

        var footer = document.createElement('div');
        footer.style.padding = '10px 24px 16px 24px';
        footer.style.borderTop = '1px solid #ddd';
        footer.style.textAlign = 'center';

        var okBtn = document.createElement('button');
        okBtn.innerText = 'OK';
        okBtn.style.padding = '6px 18px';
        okBtn.style.cursor = 'pointer';

        okBtn.onclick = function () {
            if (overlay.parentNode) overlay.parentNode.removeChild(overlay);
            if (typeof onOk === 'function') {
                try { onOk(); } catch (ex) { }
            }
        };

        footer.appendChild(okBtn);
        popup.appendChild(body);
        popup.appendChild(footer);
    }

    overlay.appendChild(popup);
    document.body.appendChild(overlay);
}



function SubmitConfirmation(fwurl) {
    if (!allowWindowClose) return;
    showSubmitPopup(fwurl);
}

function SubmitConfirmation_Server(fwurl) {
    showSubmitPopup(fwurl);
}

function showSubmitPopup(fwurl) {

    var overlay = document.createElement('div');
    overlay.id = 'popupOverlay';
    overlay.style.position = 'fixed';
    overlay.style.top = 0;
    overlay.style.left = 0;
    overlay.style.width = '100%';
    overlay.style.height = '100%';
    overlay.style.backgroundColor = 'rgba(0,0,0,0.7)';
    overlay.style.zIndex = 9999;
    overlay.style.display = 'flex';
    overlay.style.alignItems = 'center';
    overlay.style.justifyContent = 'center';

    var popup = document.createElement('div');
    popup.style.backgroundColor = '#fff';
    popup.style.padding = '20px';
    popup.style.borderRadius = '5px';
    popup.style.boxShadow = '0 0 10px #000';
    popup.style.textAlign = 'center';
    popup.innerHTML = "<p>The form has been successfully submitted.</p>";

    var okBtn = document.createElement('button');
    okBtn.innerText = 'OK';
    okBtn.style.marginTop = '10px';
    okBtn.style.padding = '5px 15px';
    okBtn.style.cursor = 'pointer';

    okBtn.onclick = function (e) {
        e.preventDefault();
        e.stopPropagation();

        // 🔑 clear so refreshes don't auto-close
        sessionStorage.removeItem('ALLOW_WINDOW_CLOSE');

        document.body.removeChild(overlay);
        window.close();
        return false;
    };

    popup.appendChild(okBtn);
    overlay.appendChild(popup);
    document.body.appendChild(overlay);
}


function setBusy() {
    document.body.style.cursor = 'wait';
}

function setDefault() {
    document.body.style.cursor = 'default';
}

function ConfirmMessage() {
    var r = confirm(arguments[0]);
    document.getElementById("inpHide").value = r;
}

function WorklistItemLocked() {
    var message = arguments[0];

    // Step 1: Create overlay
    var overlay = document.createElement('div');
    overlay.id = 'customAlertOverlay';
    overlay.style.position = 'fixed';
    overlay.style.top = 0;
    overlay.style.left = 0;
    overlay.style.width = '100%';
    overlay.style.height = '100%';
    overlay.style.backgroundColor = 'rgba(0,0,0,0.7)';
    overlay.style.zIndex = 9999;
    overlay.style.display = 'flex';
    overlay.style.alignItems = 'center';
    overlay.style.justifyContent = 'center';

    // Step 2: Create popup box
    var popup = document.createElement('div');
    popup.style.backgroundColor = '#fff';
    popup.style.padding = '20px';
    popup.style.borderRadius = '5px';
    popup.style.boxShadow = '0 0 10px #000';
    popup.style.textAlign = 'center';
    popup.style.maxWidth = '400px';
    popup.style.wordWrap = 'break-word';
    popup.innerHTML = `<p>${message}</p>`;

    // Step 3: Add OK button
    var okBtn = document.createElement('button');
    okBtn.innerText = 'OK';
    okBtn.style.marginTop = '10px';
    okBtn.style.padding = '5px 15px';
    okBtn.style.cursor = 'pointer';

    okBtn.onclick = function () {
        document.body.removeChild(overlay);
        // Close current window (same as original logic)
        window.open('', '_self', '');
        window.close();
    };

    popup.appendChild(okBtn);
    overlay.appendChild(popup);
    document.body.appendChild(overlay);
}

function PreventBackspace() {
    document.onkeydown = function (event) {
        if (event.keyCode === 8) {
            var doPrevent = true;
            var types = ["text", "password", "file", "search", "email", "number", "date", "color", "datetime", "datetime-local", "month", "range", "search", "tel", "time", "url", "week"];
            var d = $(event.srcElement || event.target);
            var disabled = d.prop("readonly") || d.prop("disabled");
            if (!disabled) {
                if (d[0].isContentEditable) {
                    doPrevent = false;
                } else if (d.is("input")) {
                    var type = d.attr("type");
                    if (type) {
                        type = type.toLowerCase();
                    }
                    if (types.indexOf(type) > -1) {
                        doPrevent = false;
                    }
                } else if (d.is("textarea")) {
                    doPrevent = false;
                }
            }
            if (doPrevent) {
                event.preventDefault();
                return false;
            }
        }
    };
}
