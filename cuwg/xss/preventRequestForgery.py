"""
- `File`: preventRequestForgery.py

- `Description`: XSS challenge 3: Try to prevent request forgery
"""


import webapp2
from google.appengine.ext.webapp import template
from google.appengine.ext import ndb
import constants
import os
import logging
import datetime
import json


# use the sid as the key name
class Account(ndb.Model):
    money = ndb.IntegerProperty()
    date = ndb.DateTimeProperty(auto_now_add=True)
    comments = ndb.StringProperty()


class CommonPractise(webapp2.RequestHandler):
    def deleteSID(self):
        # Also delete cookie set by browser's console
        self.response.delete_cookie(
            'sid',
            path='/xss/preventRequestForgery'
        )

    def get(self):
        try:
            # Get sid from cookie
            sid = self.request.cookies.get('sid')

            if sid is None:
                raise Exception('Error. No sid defined')

            # Get account
            key = ndb.Key(Account, sid)
            account = key.get()

            if account is None:
                self.deleteSID()
                raise Exception('Error. No account found')

            if account.money > 0:
                raise Exception('Do not cheat :[')

            # Delete all database record
            ndb.delete_multi(
                Account.query().fetch(keys_only=True)
            )

            # Delete SID
            self.deleteSID()

            ctx = PreventRequestForgery.getBreadcrumbContext()
            ctx['showCommonPracise'] = True

            self.response.write(
                template.render(
                    os.path.join(
                        constants.TPL_DIR,
                        'preventRequestForgery.tpl'
                    ),
                    ctx
                )
            )
        except Exception, e:
            self.response.write(e.message)


class TransferHandler(webapp2.RequestHandler):
    def get(self):
        try:
            sid = self.request.cookies.get('sid')

            if 'amount' in self.request.GET:
                amount = int(self.request.GET['amount'])

            key = ndb.Key(Account, sid)
            account = key.get()
            account.money = account.money - amount
            account.money = 0 if account.money < 0 else account.money
            account.put()
            self.response.write('Success')
        except Exception, e:
            self.response.write(e.message)


class PreventRequestForgery(webapp2.RequestHandler):
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
                'name': 'Prevent Request Forgery',
                'href': '/xss/preventRequestForgery',
                'active': True,
            }],
        }

    def deleteSID(self):
        # Also delete cookie set by browser's console
        self.response.delete_cookie(
            'sid',
            path='/xss/preventRequestForgery'
        )

    def post(self):
        try:
            # Get sid from cookie
            sid = self.request.cookies.get('sid')

            if sid is None:
                raise Exception('Error. No sid defined')

            # Get account
            key = ndb.Key(Account, sid)
            account = key.get()

            if account is None:
                self.deleteSID()
                raise Exception('Error. No account found')

            # Update comments
            comments = json.loads(account.comments)
            comments.append(self.request.get('comment'))
            account.comments = json.dumps(comments)
            account.put()

            self.response.write(
                '<a href="/xss/preventRequestForgery">Back</a>'
            )
        except Exception, e:
            self.response.write(e.message)

    def get(self):
        # Get sid from cookie
        sid = self.request.cookies.get('sid')

        # Get account from db or create a new one
        account = None
        if sid is None:
            # Create a new account if there is no sid
            sid = str(datetime.datetime.now().microsecond)
            account = Account(
                key=ndb.Key('Account', sid),
                money=1000,
                comments='[]'
            )
            account.put()
        else:
            # Get account from sid
            key = ndb.Key(Account, sid)
            account = key.get()

            # Create a new one if there is no such account
            if not account:
                sid = str(datetime.datetime.now().microsecond)
                account = Account(
                    key=ndb.Key('Account', sid),
                    money=1000,
                    comments='[]'
                )
                account.put()

        # Set cookie
        self.response.set_cookie(
            'sid',
            sid,
            max_age=600,
            path='/xss/preventRequestForgery'
        )

        # Render page
        self.response.headers['X-XSS-Protection'] = '0'
        ctx = PreventRequestForgery.getBreadcrumbContext()
        ctx['currentBalance'] = account.money
        ctx['comments'] = json.loads(account.comments)
        self.response.write(
            template.render(
                os.path.join(
                    constants.TPL_DIR,
                    'preventRequestForgery.tpl'
                ),
                ctx
            )
        )
