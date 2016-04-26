"""
- `File`: sanitization.py

- `Description`: xss challenge 2: Hijack a session
"""


import webapp2
from google.appengine.ext.webapp import template
import re
import os
import constants
import random
import logging
import urlparse
import urllib


class ResultVerifyHandler(webapp2.RequestHandler):
    def get(self):
        url = urllib.unquote(self.request.url).decode('utf8')
        url = url.replace(" ", "")
        parsed = urlparse.urlparse(url)
        logging.info('ResultVerifyHandler %s ' % url)
        user = urlparse.parse_qs(parsed.query)['user']
        logging.info('user=%s' % user[0])
        
        ctx = SanitizationHandler.getBreadcrumbContext()
        ctx['isSucceeded'] = True
        if(user[0] != 'mary'):
            ctx['isSucceeded'] = False
            ctx['userError'] = True
            self.response.write(
                template.render(
                    os.path.join(
                        constants.TPL_DIR,
                        'sanitization.tpl'
                    ),
                    ctx
                )
            )
        else:
        
            logging.info('ResultVerifyHandler')
            
            
            self.response.write(
                    template.render(
                        os.path.join(
                            constants.TPL_DIR,
                            'sanitization.tpl'
                        ),
                        ctx
                    )
                )   
                
class ReviewFormHandler(webapp2.RequestHandler):
    """Handler for /xss/sanitization/reviewForm"""
    def deleteSID(self):
        # Also delete cookie set by browser's console
        self.response.delete_cookie(
            'sid',
            path='/xss/sanitization'
        )
        self.response.delete_cookie(
            'sid',
            path='/xss/sanitization/reviewForm'
        )

    def get(self):
        sid = self.request.cookies.get('sid')
        if isinstance(sid, basestring) and re.match('^john:[0-9]{1,2}', sid):

            ctx = SanitizationHandler.getBreadcrumbContext()
            ctx['sid'] = sid
            ctx['owner'] = 'john'
            self.response.write(
                template.render(
                    os.path.join(
                        constants.TPL_DIR,
                        'sanitization.tpl'
                    ),
                    ctx
                )
            )
        else:
            # Back to /xss/sanitization if there is no valid cookie
            # present
            self.deleteSID()
            self.redirect('/xss/sanitization')
            


    def post(self):
        sid = self.request.cookies.get('sid')
        action = self.request.POST['action']
        logging.info('sid=%s' % sid)
        if action == 'logout':
            # Delete cookie and back to /transaction/sessionHijack
            self.deleteSID()
            self.redirect('/xss/sanitization')
        else:
            review = self.request.get('comment')
            ctx = SanitizationHandler.getBreadcrumbContext()
            ctx['sid'] = sid
            ctx['review'] = review;
            logging.info('review=%s' % review)
            # Transfer on behalf of john
            user = self.request.get('user')
            ctx['owner'] = self.request.get('user')
            self.response.set_cookie(
                    'user',
                    user,
                    max_age=60,
                    path='/xss/sanitization/reviewForm'
                )
            self.response.headers['X-XSS-Protection'] = '0'
            self.response.write(
                template.render(
                    os.path.join(
                        constants.TPL_DIR,
                        'sanitization.tpl'
                    ),
                    ctx
                )
            )



class SanitizationHandler(webapp2.RequestHandler):
    """Handler for /xss/sanitization"""
    @classmethod
    def getBreadcrumbContext(cls):
        return {
            'breadcrumb': [{
                'name': 'Home',
                'href': '/',
                'active': False,
            }, {
                'name': 'XSS',
                'href': '/xss',
                'active': False,
            }, {
                'name': 'Sanitizing Input',
                'href': '/xss/sanitization',
                'active': True,
            }],
        }

    def get(self):
        ctx = SanitizationHandler.getBreadcrumbContext()
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'sanitization.tpl'),
                ctx
            )
        )

    def post(self):
        # Get username and password
        name = self.request.get('name')
        pw = self.request.get('pw')

        if (name == 'john' and pw == 'john'):
            redirectPath = '/xss/sanitization/reviewForm'

            # Redirect to /xss/sanitization/reviewForm
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

            ctx = SanitizationHandler.getBreadcrumbContext()
            ctx['passwordIncorrect'] = passwordIncorrect

            self.response.write(
                template.render(
                    os.path.join(constants.TPL_DIR, 'sanitization.tpl'),
                    ctx
                )
            )
