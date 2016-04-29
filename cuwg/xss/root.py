"""
- `File`: root.py

- `Github`: https://github.com/mondwan/ProjectCUWG

- `Description`: A handler for the root of xss
"""

import os
import webapp2
from google.appengine.ext.webapp import template
import constants


class XSSRootHandler(webapp2.RequestHandler):
    """Handler for /xss
    """
    def get(self):
        # Render the template
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'xssIndex.tpl'),
                {
                    'breadcrumb': [{
                        'name': 'Home',
                        'href': '/',
                        'active': False,
                    }, {
                        'name': 'XSS',
                        'href': '/xss',
                        'active': True,
                    }],
                }
            )
        )
