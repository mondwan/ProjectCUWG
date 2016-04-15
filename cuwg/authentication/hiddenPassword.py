"""
- `File`: hiddenPassword.py

- `Description`: Authentication challenge 2: Hidden a password in the form
"""


import webapp2
from google.appengine.ext.webapp import template
import os
import constants


class HiddenPasswordHandler(webapp2.RequestHandler):
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
                'href': '/authentication/hiddenPassword',
                'active': True,
            }],
        }

    def get(self):
        ctx = self.getBreadcrumbContext()
        ctx['isSucceeded'] = False
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'hiddenPassword.tpl'),
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
                os.path.join(constants.TPL_DIR, 'hiddenPassword.tpl'),
                ctx
            )
        )
