"""
- `File`: password.py

- `Description`: Authentication challenge 1: Password
"""


import webapp2
from google.appengine.ext.webapp import template
import os
import constants


class PasswordFileHandler(webapp2.RequestHandler):
    def get(self):
        self.response.write(
            '{user:mary, pw:"7c6a180b36896a0a8c02787eeafb0e4c"}, {user:sam, pw:"6cb75f652a9b52798eb6cf2201057c73"}, {user:peter, pw: "e10adc3949ba59abbe56e057f20f883e"}'
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
                        'name': 'RainbowTable',
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
                'name': 'Hidden Password',
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

        if name == 'mary' and pw == 'helloworld':
            isSucceeded = True
        else:
            isSucceeded = False

        ctx = self.getBreadcrumbContext()
        ctx['isSucceeded'] = isSucceeded

        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'rainbowTable.tpl'),
                ctx
            )
        )
