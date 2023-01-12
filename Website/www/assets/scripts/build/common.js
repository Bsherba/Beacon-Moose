"use strict";

function _defineProperty(obj, key, value) { key = _toPropertyKey(key); if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }
function _toPropertyKey(arg) { var key = _toPrimitive(arg, "string"); return typeof key === "symbol" ? key : String(key); }
function _toPrimitive(input, hint) { if (typeof input !== "object" || input === null) return input; var prim = input[Symbol.toPrimitive]; if (prim !== undefined) { var res = prim.call(input, hint || "default"); if (typeof res !== "object") return res; throw new TypeError("@@toPrimitive must return a primitive value."); } return (hint === "string" ? String : Number)(input); }
if (!String.prototype.endsWith) {
  String.prototype.endsWith = function (search, this_len) {
    if (this_len === undefined || this_len > this.length) {
      this_len = this.length;
    }
    return this.substring(this_len - search.length, this_len) === search;
  };
}
if (!('randomUUID' in crypto)) {
  // https://stackoverflow.com/a/2117523/2800218
  // LICENSE: https://creativecommons.org/licenses/by-sa/4.0/legalcode
  crypto.randomUUID = function randomUUID() {
    return ([1e7] + -1e3 + -4e3 + -8e3 + -1e11).replace(/[018]/g, c => (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16));
  };
}
class BeaconWebRequest {
  static prepareResponse(xhr) {
    return {
      xhr: xhr,
      status: xhr.status,
      statusText: xhr.statusText,
      body: xhr.responseText,
      success: xhr.status >= 200 && xhr.status < 300
    };
  }
  static start(method, url) {
    var body = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : null;
    var headers = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : {};
    return new Promise((resolve, reject) => {
      var xhr = new XMLHttpRequest();
      xhr.open(method, url, true);
      if (typeof headers === 'object' && headers !== null && Array.isArray(headers) === false) {
        var keys = Object.keys(headers);
        for (var key of keys) {
          xhr.setRequestHeader(key, headers[key]);
        }
      }
      xhr.onload = () => {
        var response = this.prepareResponse(xhr);
        if (response.success) {
          resolve(response);
        } else {
          reject(response);
        }
      };
      xhr.onerror = () => {
        reject(this.prepareResponse(xhr));
      };
      xhr.send(body);
    });
  }
  static get(url) {
    var headers = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    return BeaconWebRequest.start('GET', url, null, headers);
  }
  static post(url, body) {
    var headers = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
    if (body instanceof URLSearchParams) {
      headers['Content-Type'] = 'application/x-www-form-urlencoded';
      return BeaconWebRequest.start('POST', url, body.toString(), headers);
    } else if (typeof body === 'object' && body !== null || Array.isArray(body)) {
      headers['Content-Type'] = 'application/json';
      return BeaconWebRequest.start('POST', url, JSON.stringify(body), headers);
    } else {
      return BeaconWebRequest.start('POST', url, body, headers);
    }
  }
  static delete(url) {
    var headers = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    return BeaconWebRequest.start('DELETE', url, null, headers);
  }
}
class BeaconDialog {
  static show(message) {
    var explanation = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : undefined;
    var actionCaption = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 'Ok';
    return BeaconDialog.confirm(message, explanation, actionCaption, null);
  }
  static confirm(message) {
    var explanation = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : undefined;
    var actionCaption = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 'Ok';
    var cancelCaption = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : 'Cancel';
    return new Promise((resolve, reject) => {
      var overlay = document.getElementById('overlay');
      var dialogFrame = document.getElementById('dialog');
      var dialogMessage = document.getElementById('dialog_message');
      var dialogExplanation = document.getElementById('dialog_explanation');
      var dialogActionButton = document.getElementById('dialog_action_button');
      var dialogCancelButton = document.getElementById('dialog_cancel_button');
      if (!(overlay && dialogFrame && dialogMessage && dialogExplanation && dialogActionButton && dialogCancelButton)) {
        reject();
        return;
      }
      overlay.className = 'exist';
      dialogFrame.className = 'exist';
      setTimeout(() => {
        overlay.className = 'exist visible';
        dialogFrame.className = 'exist visible';
      }, 10);
      dialogMessage.innerText = message;
      if (explanation) {
        dialogExplanation.innerText = explanation;
      } else {
        dialogExplanation.innerText = '';
      }
      if (dialogActionButton.clickHandler) {
        dialogActionButton.removeEventListener('click', dialogActionButton.clickHandler);
      }
      if (dialogCancelButton.clickHandler) {
        dialogCancelButton.removeEventListener('click', dialogCancelButton.clickHandler);
      }
      dialogActionButton.clickHandler = event => {
        BeaconDialog.hide();
        setTimeout(() => {
          resolve();
        }, 300);
      };
      dialogActionButton.addEventListener('click', dialogActionButton.clickHandler);
      dialogActionButton.innerText = actionCaption;
      if (cancelCaption) {
        dialogCancelButton.clickHandler = event => {
          BeaconDialog.hide();
          setTimeout(() => {
            reject();
          }, 300);
        };
        dialogCancelButton.addEventListener('click', dialogCancelButton.clickHandler);
        dialogCancelButton.innerText = cancelCaption;
      } else {
        dialogCancelButton.className = 'hidden';
      }
    });
  }
  static hide() {
    var overlay = document.getElementById('overlay');
    var dialogFrame = document.getElementById('dialog');
    if (!(overlay && dialogFrame)) {
      return;
    }
    overlay.className = 'exist';
    dialogFrame.className = 'exist';
    setTimeout(() => {
      overlay.className = '';
      dialogFrame.className = '';
    }, 300);
  }
  static showModal(elementId) {
    if (BeaconDialog.activeModal) {
      return;
    }
    var overlay = document.getElementById('overlay');
    var modal = document.getElementById(elementId);
    if (!(overlay && modal)) {
      return;
    }
    overlay.classList.add('exist');
    modal.classList.add('exist');
    BeaconDialog.activeModal = elementId;
    setTimeout(() => {
      overlay.classList.add('visible');
      modal.classList.add('visible');
    }, 10);
  }
  static hideModal() {
    if (!BeaconDialog.activeModal) {
      return;
    }
    var overlay = document.getElementById('overlay');
    var modal = document.getElementById(BeaconDialog.activeModal);
    if (!(overlay && modal)) {
      return;
    }
    overlay.classList.remove('visible');
    modal.classList.remove('visible');
    setTimeout(function () {
      overlay.classList.remove('exist');
      modal.classList.remove('exist');
      BeaconDialog.activeModal = null;
    }, 300);
  }
}
_defineProperty(BeaconDialog, "activeModal", null);
class PagePanel {
  constructor(element) {
    _defineProperty(this, "element", null);
    _defineProperty(this, "pageMap", {});
    _defineProperty(this, "currentPageName", null);
    this.element = element;
    var pages = element.querySelectorAll('div.page-panel-page');
    for (var page of pages) {
      var pageName = page.getAttribute('page');
      this.pageMap[pageName] = page;
      if (page.classList.contains('page-panel-visible')) {
        this.currentPageName = pageName;
      }
    }
    var links = element.querySelectorAll('div.page-panel-nav a');
    for (var link of links) {
      var _pageName = link.getAttribute('page');
      this.pageMap[_pageName].link = link;
      link.addEventListener('click', ev => {
        ev.preventDefault();
        this.switchPage(ev.target.getAttribute('page'));
      });
    }
    var ev = new Event('panelCreated');
    ev.panel = this;
    this.element.dispatchEvent(ev);
  }
  switchPage(newPageName) {
    var oldPageName = this.currentPageName;
    if (oldPageName === newPageName) {
      return;
    }
    if (!this.pageMap[newPageName]) {
      return;
    }
    this.pageMap[oldPageName].classList.remove('page-panel-visible');
    this.pageMap[oldPageName].link.parentElement.classList.remove('page-panel-active');
    this.pageMap[newPageName].classList.add('page-panel-visible');
    this.pageMap[newPageName].link.parentElement.classList.add('page-panel-active');
    this.currentPageName = newPageName;
    var ev = new Event('panelSwitched');
    ev.panel = this;
    this.element.dispatchEvent(ev);
  }
  static init() {
    var panels = document.querySelectorAll('div.page-panel');
    for (var panel of panels) {
      PagePanel.pagePanels[panel.id] = new PagePanel(panel);
    }
  }
}
_defineProperty(PagePanel, "pagePanels", {});
document.addEventListener('DOMContentLoaded', () => {
  PagePanel.init();
});