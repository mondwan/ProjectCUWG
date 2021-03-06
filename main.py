#!/usr/bin/env python
#
# Copyright 2007 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


import webapp2
from cuwg.root import RootHandler
from cuwg.authentication.root import AuthenticationRootHandler
from cuwg.authentication.password import PasswordHandler
from cuwg.authentication.password import SignUp
from cuwg.authentication.hiddenPassword import HiddenPasswordHandler
from cuwg.authentication.rainbowTable import RainbowTableHandler
from cuwg.authentication.rainbowTable import PasswordFileHandler
from cuwg.authentication.rainbowTable import PasswordLogin
from cuwg.transaction.root import TransactionRootHandler
from cuwg.transaction.cookies import TransactionHandler
from cuwg.transaction.cookies import CookiesSignin
from cuwg.transaction.cookies import CookiesCrack
from cuwg.transaction.httpAuthentication import HttpAuthenticationHandler
from cuwg.transaction.sessionHijack import SessionHijackHandler
from cuwg.transaction.sessionHijack import TransferFormHandler
from cuwg.xss.root import XSSRootHandler
from cuwg.xss.sanitization import SanitizationHandler
from cuwg.xss.sanitization import ReviewFormHandler
from cuwg.xss.sanitization import ResultVerifyHandler
from cuwg.xss.javascript import JavascriptHandler
from cuwg.xss.javascript import ProductHandler
from cuwg.xss.javascript import PreorderHandler
from cuwg.xss.javascript import UpdateStateHandler
from cuwg.xss.preventRequestForgery import PreventRequestForgery
from cuwg.xss.preventRequestForgery import TransferHandler
from cuwg.xss.preventRequestForgery import CommonPractise
# from cuwg.transaction import TransactionHandler
# from cuwg.xss import XSSHandler


# Setup the WSGI server
app = webapp2.WSGIApplication([
    webapp2.Route('/', RootHandler, 'index'),
    webapp2.Route(
        '/authentication',
        AuthenticationRootHandler,
        'authenticationIndex'
    ),
    webapp2.Route(
        '/authentication/password',
        PasswordHandler,
        'password'
    ),
    webapp2.Route(
        '/authentication/password/login',
        PasswordLogin,
        'passwordLogin'
    ),
    webapp2.Route(
        '/authentication/password/signUp',
        SignUp,
        'signUp'
    ),
    webapp2.Route(
        '/authentication/hiddenPassword',
        HiddenPasswordHandler,
        'hiddenPassword'
    ),
    webapp2.Route(
        '/authentication/rainbowTable',
        RainbowTableHandler,
        'rainbowTable'
    ),
    webapp2.Route(
        '/authentication/rainbowTable/passwordFile',
        PasswordFileHandler,
        'passwordFile'
    ),
    webapp2.Route(
        '/authentication/rainbowTable/login',
        PasswordLogin,
        'passwordLogin'
    ),
    webapp2.Route('/transaction', TransactionRootHandler, 'transactionIndex'),
    webapp2.Route(
        '/transaction/cookies',
        TransactionHandler,
        'cookies'
    ),
    webapp2.Route(
        '/transaction/cookies/sid=2019900615',
        CookiesSignin,
        'cookiesSignin'
    ),
    webapp2.Route(
        '/transaction/cookies/sid=2019900617',
        CookiesCrack,
        'cookiesCrack'
    ),
    webapp2.Route(
        '/transaction/sessionHijack',
        SessionHijackHandler,
        'sessionHijack'
    ),
    webapp2.Route(
        '/transaction/sessionHijack/transferForm',
        TransferFormHandler,
        'transferForm'
    ),
    webapp2.Route(
        '/transaction/httpAuthentication',
        HttpAuthenticationHandler,
        'httpAuthentication'
    ),
    webapp2.Route('/xss', XSSRootHandler, 'xssIndex'),
    webapp2.Route(
        '/xss/sanitization',
        SanitizationHandler,
        'sanitization'
    ),
    webapp2.Route(
        '/xss/sanitization/reviewForm',
        ReviewFormHandler,
        'reviewForm'
    ),
    webapp2.Route(
        '/xss/sanitization/cookies',
        ResultVerifyHandler,
        'xssCookies'
    ),
    webapp2.Route(
        '/xss/javascript',
        JavascriptHandler,
        'javascript'
    ),
    webapp2.Route(
        '/xss/javascript/product',
        ProductHandler,
        'product'
    ),
    webapp2.Route(
        '/xss/javascript/preorder',
        PreorderHandler,
        'preorder'
    ),
    webapp2.Route(
        '/xss/javascript/updateState',
        UpdateStateHandler,
        'updateState'
    ),
    webapp2.Route(
        '/xss/preventRequestForgery',
        PreventRequestForgery,
        'preventRequestForgery'
    ),
    webapp2.Route(
        '/xss/preventRequestForgery/transfer',
        TransferHandler,
        'TransferHandler'
    ),
    webapp2.Route(
        '/xss/preventRequestForgery/commonPractise',
        CommonPractise,
        'CommonPractise'
    ),
    # webapp2.Route('/xss', XSSHandler, 'xss'),
], debug=True)
