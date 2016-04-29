"""
- `File`: root.py

- `Github`: https://github.com/mondwan/ProjectCUWG

- `Description`: A handler for the root of /authentication
"""

import os
import webapp2
from google.appengine.ext.webapp import template
import constants


class AuthenticationRootHandler(webapp2.RequestHandler):
    """Handler for /authentication
    """
    def get(self):
        # Render the template
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'authenticationIndex.tpl'),
                {
                    'breadcrumb': [{
                        'name': 'Home',
                        'href': '/',
                        'active': False,
                    }, {
                        'name': 'Authentication',
                        'href': '/authentication',
                        'active': True,
                    }],
                }
            )
        )
