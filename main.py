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
from cuwg.authentication.password import PasswordHandler
from cuwg.authentication.password import PasswordLogin
from cuwg.authentication.password import SignUp
from cuwg.authentication.hidden import HiddenHandler
from cuwg.authentication.hidden import PasswordFileHandler
from cuwg.authentication.hidden import PasswordLogin
from cuwg.transaction.cookies import TransactionHandler
from cuwg.transaction.cookies import CookiesSignin
from cuwg.transaction.cookies import CookiesCrack
# from cuwg.transaction import TransactionHandler
# from cuwg.xss import XSSHandler


# Setup the WSGI server
app = webapp2.WSGIApplication([
    webapp2.Route('/', RootHandler, 'index'),
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
        '/authentication/hidden',
        HiddenHandler,
        'hidden'
    ),
    webapp2.Route(
        '/authentication/hidden/passwordFile',
        PasswordFileHandler,
        'passwordFile'
    ),
    webapp2.Route(
        '/authentication/hidden/login',
        PasswordLogin,
        'passwordLogin'
    ),
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
    
    # webapp2.Route('/transaction', TransactionHandler, 'transaction'),
    # webapp2.Route('/xss', XSSHandler, 'xss'),
], debug=True)
