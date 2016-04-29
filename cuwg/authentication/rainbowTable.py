"""
- `File`: password.py

- `Description`: Authentication challenge 3: rainbow table
"""


import webapp2
from google.appengine.ext.webapp import template
import os
import constants


class PasswordFileHandler(webapp2.RequestHandler):
    def get(self):
        self.response.write(
            '{user:mary, pw_hash:"4353"}'
        )

class PasswordLogin(webapp2.RequestHandler):
    def post(self):
        name = self.request.get('name')
        pw = self.request.get('pw')

        result = False
        if name == 'mary':
            if pw == 'M@rY12':
                result = True

        isLogin = True
        if result:
            isLogin = False

        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'rainbowTable.tpl'),
                {
                    'breadcrumb': [{
                        'name': 'Home',
                        'href': '/',
                        'active': False,
                    }, {
                        'name': 'Authentication',
                        'href': '/authentication',
                        'active': False,
                    }, {
                        'name': 'Rainbow Table',
                        'href': '/authentication/rainbowTable',
                        'active': True,
                    }],
                    'isSignUp': False,
                    'isLogin': isLogin,
                    'isSucceeded': result,
                    'isStarted': True

                }
            )
        )


class RainbowTableHandler(webapp2.RequestHandler):

    def getBreadcrumbContext(self):
        return {
            'breadcrumb': [{
                'name': 'Home',
                'href': '/',
                'active': False,
            }, {
                'name': 'Authentication',
                'href': '/authentication',
                'active': False,
            }, {
                'name': 'Rainbow Table',
                'href': '/authentication/rainbowTable',
                'active': True,
            }],
        }
        
    def get(self):
        ctx = self.getBreadcrumbContext()
        ctx['isSucceeded'] = False
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'rainbowTable.tpl'),
                ctx
            )
        )

    def post(self):
        name = self.request.get('name')
        pw = self.request.get('pw')

        if name == 'mary' and pw == '900617':
            isSucceeded = True
            userError = False
        else:
            isSucceeded = False
            userError = True

        ctx = self.getBreadcrumbContext()
        ctx['isSucceeded'] = isSucceeded
        ctx['userError'] = userError

        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'rainbowTable.tpl'),
                ctx
            )
        )
