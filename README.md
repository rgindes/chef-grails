Grails Cookbook
==========================
This cookbook installs Grails and sets JAVA_HOME and GRAILS_HOME.

Requirements
------------
This cookbook requires an installation of 'yum-gd' and 'java'.

Attributes
----------

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['grails']['version']</tt></td>
    <td>Text</td>
    <td>Default version of Grails to install.</td>
    <td>3.0.3</td>
  </tr>
    <tr>
    <td><tt>['grails']['java_home']</tt></td>
    <td>Text</td>
    <td>Directory where /bin/java lives (note that's /bin/java and not java).</td>
    <td>/usr</td>
  </tr>
    <tr>
    <td><tt>['grails']['grails_home']</tt></td>
    <td>Text</td>
    <td>Directory to install Grails into.</td>
    <td>/opt</td>
  </tr>
</table>

Usage
-----

Just include `grails` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[grails]"
  ]
}
```

License and Authors
-------------------
Authors: Gannett Digital
