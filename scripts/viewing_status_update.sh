#!/bin/bash

DBNAME=dbname
USER=username
PASS=password
HOST=localhost
STATEMENT="UPDATE viewing_status SET difference = (runtime-current_play_time); UPDATE viewing_status SET tvshowprofileid = concat(user_id, '999999', tv_show_id) WHERE tv_show_id IS NOT NULL; UPDATE viewing_status SET movieprofileid = concat(user_id, '999999', video_id) WHERE tv_show_id IS NULL; UPDATE viewing_status a INNER JOIN (  SELECT tvshowprofileid, COUNT(*) AS tempcount  FROM viewing_status GROUP BY tvshowprofileid ) b  ON a.tvshowprofileid = b.tvshowprofileid SET a.tempcount = b.tempcount; DELETE FROM viewing_status WHERE difference < 60 AND tempcount > 1 AND tvshowprofileid IS NOT NULL; UPDATE viewing_status a INNER JOIN (  SELECT movieprofileid, COUNT(*) AS tempcount  FROM viewing_status GROUP BY movieprofileid ) b  ON a.movieprofileid = b.movieprofileid SET a.tempcount = b.tempcount; DELETE FROM viewing_status WHERE difference < 300 AND movieprofileid IS NOT NULL; UPDATE viewing_status SET tempcount=NULL;"

mysql $DBNAME -h $HOST -u$USER -p$PASS  -e "$STATEMENT"
