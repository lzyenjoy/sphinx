<?php

require_once 'sphinxapi.php';
        
        $s= new SphinxClient();
        $s->setServer('localhost',9312);
        $keyword = "blog";//要搜索的关键字
        $index = 'goods';//索引名称
        //查询出关键字所在的主键id
        $s->_limit = 2000;
        $res = $s->Query($keyword,$index);
        echo '<pre>';

        if (isset($res['matches'])){
        	print_r($res);die;
            $ids = array_keys($res['matches']);
            $ids = implode(',',$ids);
        }else{
            print_r("内容不存在");
            return;
        }
        //获取匹配到的主键id
        $mysql_con = mysqli_connect('localhost','root','123456','blog');//本地数据库
        mysqli_query($mysql_con,'set name utf8');
        mysqli_query($mysql_con,'use blog');
        $sql = "select * from document where id in ($ids)";
        
        $res = mysqli_query($mysql_con,$sql);

        while ($row = mysqli_fetch_assoc($res)){
            $data[] = $row;
        }
        foreach ($data as $key => $v){

            $v = str_replace($keyword,"<font color='red'>{$keyword}</font>",$v);
            $data[$key] = $v;
        }
        print_r($data);