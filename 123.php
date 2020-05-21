<?php
date_default_timezone_get("PRC");
date_default_timezone_get("Asia/Hong_Kong");
setlocale(LC_TIME, "zh_CN.gb2312");
echo strftime("%Y-%m-%d %X %Z");
