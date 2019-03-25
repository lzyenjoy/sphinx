<?php
require_once 'sphinxapi.php';
use Sphinx\SphinxClient;
$s= new SphinxClient();
$s->setServer('122.152.250.154',9312);
$keyword = "好我是来测试钩子的吗";//要搜索的关键字
$index = 'goods';//索引名称
////查询出关键字所在的主键id
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
    'host'    => '122.152.250.154',
    'db'      => 'sphinx',
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
$sql = "select * from documents where id in ($ids)";
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
print_r($data);die;
$res->free();
$mysqli->close();



