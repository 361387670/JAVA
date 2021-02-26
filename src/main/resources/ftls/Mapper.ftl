<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${Configuration.packageName}.${Configuration.path.dao}.${DaoClassName}">

    <resultMap id="${EntityName}ResultMap" type="${Configuration.packageName}.${Configuration.path.entity}.${ClassName}">
        ${ResultMap}
        ${Association}
        ${Collection}
    </resultMap>


    <insert id="insert">
        INSERT INTO `${TableName}`(
            ${InsertProperties}
        )
        VALUES (
            ${InsertValues}
        )
    </insert>

    <insert id="insertBatch">
        INSERT INTO ${TableName}(
            ${InsertProperties}
        )
        VALUES
        <foreach collection ="list" item="${EntityName}" separator =",">
        (
            ${InsertBatchValues}
        )
        </foreach>
    </insert>

    <update id="update">
        UPDATE `${TableName}` SET
        ${UpdateProperties}
        WHERE `${PrimaryColumn.columnName}` = ${r"#{"}${PrimaryColumn.propertyName}${r"}"}
    </update>

</mapper>