# osmboxes
A tool to split a .osm file into multiple files, designed to be used with OSM Tasking Manager 2

It uses osmconvert to get the job done.

Usage:

./osmboxes.sh file.osm osmtm_tasks_XX.json

osmtm_tasks_XX.json can be retreived using a URL like this:

http://your-osm-tasking-manager-site.com/project/XX/tasks.json

Where XX is the project number.

After obtaining the files, you should add a link in the per task instructions like this:

[Download and open with JOSM the data for this area](http://127.0.0.1:8111/import?url=http://your-server.com/osmdata-{x}-{y}.osm)
