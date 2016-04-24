"""
- `File`: httpAuthentication.py

- `Description`:  Transaction challenge 3: Http Authentication
"""

import webapp2
from google.appengine.ext.webapp import template
import os
import constants


class HttpAuthenticationHandler(webapp2.RequestHandler):
    """Handler for /transaction/httpAuthentication"""
    @classmethod
    def getBreadcrumbContext(cls):
        return {
            'breadcrumb': [{
                'name': 'Home',
                'href': '/',
                'active': False,
            }, {
                'name': 'Transaction',
                'href': '/transaction',
                'active': False,
            }, {
                'name': 'Http Authentication',
                'href': '/transaction/httpAuthentication',
                'active': True,
            }],
        }

    def get(self):
        ctx = HttpAuthenticationHandler.getBreadcrumbContext()
        ctx['isSucceeded'] = False
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'httpAuthentication.tpl'),
                ctx
            )
        )

    def post(self):
        ctx = HttpAuthenticationHandler.getBreadcrumbContext()
        expectToken = 'Basic aGFoYToxMjM0'
        logoutToken = 'Basic logout'
        if (
            'Authorization' in self.request.headers and
            self.request.headers['Authorization'] == expectToken
        ):
            ctx['isSucceeded'] = True
        elif (
            'Authorization' in self.request.headers and
            self.request.headers['Authorization'] == logoutToken
        ):
            ctx['isSucceeded'] = False
        else:
            ctx['isSucceeded'] = False
            self.response.status = '401 Unauthorized'
            self.response.headers['WWW-Authenticate'] = \
                'Basic realm="Enter credential"'

        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'httpAuthentication.tpl'),
                ctx
            )
        )
