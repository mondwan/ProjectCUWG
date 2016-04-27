"""
- `File`: javascript.py

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


class PreorderHandler(webapp2.RequestHandler):
    def post(self):
        logging.info("POST")
      
        id = self.request.get('id')
        ctx = JavascriptHandler.getBreadcrumbContext()
        logging.info('id=%s' % id)
        ctx['isSucceeded'] = False
        if id == 'id2':
            ctx['isSucceeded'] = True
            logging.info('isSucceeded True ')
        else:
            ctx['userError'] = True
            
        self.response.write(
            template.render(
                os.path.join(
                    constants.TPL_DIR,
                    'javascript.tpl'
                ),
                ctx
            )
        )

class UpdateStateHandler(webapp2.RequestHandler):
    def post(self):
        self.redirect('/xss/javascript/product')
class ProductHandler(webapp2.RequestHandler):
    """Handler for /xss/javascript/product"""
    def deleteSID(self):
        # Also delete cookie set by browser's console
        self.response.delete_cookie(
            'sid',
            path='/xss/javascript'
        )
        self.response.delete_cookie(
            'sid',
            path='/xss/javascript/product'
        )

    def get(self):
        sid = self.request.cookies.get('sid')
        sid = 'john:4'
        if isinstance(sid, basestring) and re.match('^john:[0-9]{1,2}', sid):
            logging.info("ProductHandler")
            ctx = JavascriptHandler.getBreadcrumbContext()
            ctx['sid'] = sid
            
            self.response.set_cookie(
                    'ispremium',
                    'False',
                    max_age=60,
                    path='/xss/javascript/product'
                )
                
            self.response.write(
                template.render(
                    os.path.join(
                        constants.TPL_DIR,
                        'javascript.tpl'
                    ),
                    ctx
                )
            )
        else:
            # Back to /xss/javascript if there is no valid cookie
            # present
            #self.deleteSID()
           # self.redirect('/xss/javascript')
            ctx = JavascriptHandler.getBreadcrumbContext()
            ctx['sid'] = sid

            self.response.write(
                template.render(
                    os.path.join(
                        constants.TPL_DIR,
                        'javascript.tpl'
                    ),
                    ctx
                )
            )
            


    def post(self):
        logging.info("POST")
        sid = self.request.cookies.get('sid')
        action = self.request.POST['action']
        if action == 'logout':
            # Delete cookie and back to /xss/javascript
            logging.info("logout!")
            self.deleteSID()
            self.redirect('/xss/javascript')
        else:
            id = self.request.get('id')
            ctx = javascriptHandler.getBreadcrumbContext()
            ctx['sid'] = sid
            ctx['review'] = review;
            logging.info('id=%s' % id)
            # Transfer on behalf of john
            user = self.request.get('user')
            
            self.response.write(
                template.render(
                    os.path.join(
                        constants.TPL_DIR,
                        'javascript.tpl'
                    ),
                    ctx
                )
            )



class JavascriptHandler(webapp2.RequestHandler):
    """Handler for /xss/javascript"""
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
                'name': 'Client Side XSS',
                'href': '/xss/javascript',
                'active': True,
            }],
        }

    def get(self):
        ctx = JavascriptHandler.getBreadcrumbContext()
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'javascript.tpl'),
                ctx
            )
        )

    def post(self):
        # Get username and password
        name = self.request.get('name')
        pw = self.request.get('pw')
        if (name == 'john' and pw == 'john'):
            redirectPath = '/xss/javascript/product'

            # Redirect to /xss/javascript/product
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

            ctx = javascriptHandler.getBreadcrumbContext()
            ctx['passwordIncorrect'] = passwordIncorrect

            self.response.write(
                template.render(
                    os.path.join(constants.TPL_DIR, 'javascript.tpl'),
                    ctx
                )
            )
