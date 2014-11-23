import re
from datetime import datetime, date
try:
    import json
except:
    import simplejson as json
__jsdateregexp__ = re.compile(r'"\*\*(new Date\([0-9,]+\))"')
class __JSONDateEncoder__(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime):
            return '%i/%i/%i %i:%i:%i' % (obj.day,obj.month-1,obj.year,obj.hour,obj.minute,obj.second)
        if isinstance(obj, date):
            return '%i/%i/%i' % (obj.day,obj.month-1,obj.year)
        return json.JSONEncoder.default(self, obj)
    # def default(self, obj):
    #     if isinstance(obj, datetime):
    #         return '**new Date(%i,%i,%i,%i,%i,%i)' % (obj.year,
    #                                                   obj.month-1,
    #                                                   obj.day,
    #                                                   obj.hour,
    #                                                   obj.minute,
    #                                                   obj.second)
    #     if isinstance(obj, date):
    #         return '**new Date(%i,%i,%i)' % (obj.year,
    #                                          obj.month-1,
    #                                          obj.day)
    #     return json.JSONEncoder.default(self, obj)


def dumps(obj):
    """ A (simple)json wrapper that can wrap up python datetime and date
    objects into Javascript date objects.
    @param obj: the python object (possibly containing dates or datetimes) for
        (simple)json to serialize into JSON

    @returns: JSON version of the passed object
    """
    out = __jsdateregexp__.sub(r'\1', json.dumps(obj, cls=__JSONDateEncoder__))
    return unicode(out).decode('utf-8')