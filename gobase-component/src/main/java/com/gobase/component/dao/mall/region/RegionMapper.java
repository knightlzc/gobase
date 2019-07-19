package com.gobase.component.dao.mall.region;


import com.gobase.component.bean.mall.region.Region;
import com.gobase.component.bean.mall.region.RegionExample;
import com.gobase.component.dao.IBaseMapper;

public interface RegionMapper extends IBaseMapper<RegionExample,Region> {

    Region selectByGbCode(int gbCode);
}