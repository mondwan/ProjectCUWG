"""
- `File`: sessionHijack.py

- `Description`: Transaction challenge 2: Hijack a session
"""


import webapp2
from google.appengine.ext.webapp import template
import re
import os
import constants
import random
import logging


class TransferFormHandler(webapp2.RequestHandler):
    """Handler for /transaction/sessionHijack/transferForm"""
    def deleteSID(self):
        # Also delete cookie set by browser's console
        self.response.delete_cookie(
            'sid',
            path='/transaction/sessionHijack'
        )
        self.response.delete_cookie(
            'sid',
            path='/transaction/sessionHijack/transferForm'
        )

    def get(self):
        sid = self.request.cookies.get('sid')
        if isinstance(sid, basestring) and re.match('^john:[0-9]{1,2}', sid):
            ctx = SessionHijackHandler.getBreadcrumbContext()
            ctx['sid'] = sid

            self.response.write(
                template.render(
                    os.path.join(
                        constants.TPL_DIR,
                        'sessionHijack.tpl'
                    ),
                    ctx
                )
            )
        else:
            # Back to /transaction/sessionHijack if there is no valid cookie
            # present
            self.deleteSID()
            self.redirect('/transaction/sessionHijack')

    def post(self):
        sid = self.request.cookies.get('sid')
        action = self.request.POST['action']
        logging.info('sid=%s' % sid)
        if action == 'logout':
            # Delete cookie and back to /transaction/sessionHijack
            self.deleteSID()
            self.redirect('/transaction/sessionHijack')
        elif isinstance(sid, basestring):
            ctx = SessionHijackHandler.getBreadcrumbContext()
            ctx['sid'] = sid

            if re.match('^john:[0-9]{1,2}', sid):
                # Transfer on behalf of john
                ctx['owner'] = 'john'
                self.response.write(
                    template.render(
                        os.path.join(
                            constants.TPL_DIR,
                            'sessionHijack.tpl'
                        ),
                        ctx
                    )
                )
            elif re.match('^mary:7', sid):
                # Remove current SID
                self.deleteSID()

                ctx['isSucceeded'] = True
                self.response.write(
                    template.render(
                        os.path.join(
                            constants.TPL_DIR,
                            'sessionHijack.tpl'
                        ),
                        ctx
                    )
                )
            else:
                # Back to /transferForm/sessionHijack if invalid cookie try
                self.deleteSID()
                self.redirect('/transaction/sessionHijack')
        else:
            # Back to /transferForm/sessionHijack if there is no valid cookie
            # present
            self.deleteSID()
            self.redirect('/transaction/sessionHijack')


class SessionHijackHandler(webapp2.RequestHandler):
    """Handler for /transaction/sessionHijack"""
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
                'name': 'Session Hijack',
                'href': '/transaction/sessionHijack',
                'active': True,
            }],
        }

    def get(self):
        ctx = SessionHijackHandler.getBreadcrumbContext()
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'sessionHijack.tpl'),
                ctx
            )
        )

    def post(self):
        # Get username and password
        name = self.request.get('name')
        pw = self.request.get('pw')

        if (name == 'john' and pw == 'john'):
            redirectPath = '/transaction/sessionHijack/transferForm'

            # Redirect to /transaction/sessionHijack/transferForm
            sid = 'john:%d' % random.randint(1, 10)
            logging.info('sid=%s' % sid)
            self.response.status = 302
            self.response.set_cookie(
                'sid',
                sid,
                max_age=60,
                path=redirectPath
            )
            self.redirect(redirectPath)
        else:
            passwordIncorrect = True

            ctx = SessionHijackHandler.getBreadcrumbContext()
            ctx['passwordIncorrect'] = passwordIncorrect

            self.response.write(
                template.render(
                    os.path.join(constants.TPL_DIR, 'sessionHijack.tpl'),
                    ctx
                )
            )
