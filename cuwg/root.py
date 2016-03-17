"""
- `File`: root.py

- `Github`: https://github.com/mondwan/ProjectCUWG

- `Description`: A handler for the project's root
"""

import os
import webapp2
from google.appengine.ext.webapp import template
import constants


class RootHandler(webapp2.RequestHandler):
    """Handler for /
    """
    def get(self):
        # Render the template
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'index.tpl'),
                {
                    'breadcrumb': [{
                        'name': 'Home',
                        'href': '/',
                        'active': True,
                    }],
                }
            )
        )
