# osmboxes
A tool to split a .osm file into multiple files, designed to be used with OSM Tasking Manager 2

It uses osmconvert to get the job done.

Usage:
{
./osmboxes.sh file.osm osmtm_tasks_XX.json
}

osmtm_tasks_XX.json can be retreived using a URL like this:

http://your-osm-tasking-manager-site.com/project/X/tasks.json

Where X is the project number.
