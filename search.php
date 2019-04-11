<?php
require_once 'sphinxapi.php';
use Sphinx\SphinxClient;
$s= new SphinxClient();
$oldTime=strtotime(date('Y-m-d H:i:s')."-2day");
//$oldTime='2019-03-27 00:00:00';
$s->setServer('localhost',9312);
$s->SetFilter('user_id', array('308'));
$s->setFilterRange('ceateTime',$oldTime,time());
$keyword = '你现在看看能够写入了吗ddd';//要搜索的关键字
$index = 'order';//索引名称
//查询出关键字所在的主键id

$s->_limit = 2000;
$res = $s->Query($keyword,$index);
echo '<pre>';
if (isset($res['matches'])){
    $ids = array_keys($res['matches']);
    $ids = implode(',',$ids);
}else{
    print_r("内容不存在");
    return;
}
$mysql_conf = array(
    'host'    => '127.0.0.1:3306',
    'db'      => 'zhlx',
    'db_user' => 'root',
    'db_pwd'  => '123456',
);
$mysqli = @new mysqli($mysql_conf['host'], $mysql_conf['db_user'], $mysql_conf['db_pwd']);
if ($mysqli->connect_errno) {
    die("could not connect to the database:\n" . $mysqli->connect_error);//诊断连接错误
}
$mysqli->query("set names 'utf8';");//编码转化
$select_db = $mysqli->select_db($mysql_conf['db']);
if (!$select_db) {
    die("could not connect to the db:\n" .  $mysqli->error);
}
//$sql = "select subject,info,shop_id from good where id in ($ids)";
$sql="SELECT a.id AS order_detail_id,a.user_id,a.total_m,a.gg1,a.gg2,a.oid,a.pic_src,a.subject_src,a.ceateTime,b.`subject`,b.info,b.pic,c.`Shop_name` FROM member_order_detail AS a LEFT JOIN good AS b ON a.good_id=b.id LEFT JOIN company AS c ON b.shop_id=c.id WHERE a.id in ($ids) ORDER BY a.id DESC";
$res = $mysqli->query($sql);
if (!$res) {
    die("sql error:\n" . $mysqli->error);
}
while ($row = $res->fetch_assoc()) {
    $data[] = $row;
}
foreach ($data as $key => $v){
    $v = str_replace($keyword,"<font color='red'>{$keyword}</font>",$v);
    $data[$key] = $v;
}
echo count($data).'<br>';
print_r($data);die;
$res->free();
$mysqli->close();



