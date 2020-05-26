<?php
namespace app\index\controller;

class Index
{
    public function test($name = 'ThinkPHP5')
    {
        return 'hello,' . $name;
    }
}