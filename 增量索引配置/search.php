<?php
require_once 'core.php';
use Sphinx\SphinxClient;
$s= new SphinxClient();
$s->setServer('localhost',9312);
$keyword = '东风';//要搜索的关键字
$index = 'contents_index';//索引名称
//查询出关键字所在的主键id

$s->_limit = 2000;
$res = $s->Query($keyword,$index);
echo '<pre>';var_dump($res['matches']);die;
if (isset($res['matches'])){
    $ids = array_keys($res['matches']);
    $ids = implode(',',$ids);
}else{
    print_r("内容不存在");
    return;
}
$mysql_conf = array(
    'host'    => '127.0.0.1:3306',
    'db'      => 'sphinx',
    'db_user' => 'root',
    'db_pwd'  => '123456',
);
var_dump($ids);die;
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
$sql="select * from documents where in ($ids)";
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



