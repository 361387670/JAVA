<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${Configuration.packageName}.${Configuration.path.dao}.${DaoClassName}">

    <resultMap id="${EntityName}ResultMap" type="${Configuration.packageName}.${Configuration.path.entity}.${ClassName}">
        ${ResultMap}
        ${Association}
        ${Collection}
    </resultMap>

    <sql id="${EntityName}Columns">
        ${ColumnMap}
    </sql>

    <sql id="${EntityName}Joins">
        ${Joins}
    </sql>

    <select id="get" resultMap="${EntityName}ResultMap">
        SELECT
        <include refid="${EntityName}Columns" />
        FROM `${TableName}` <include refid="${EntityName}Joins" />
        <where>
            `${TableName}`.`${PrimaryColumn.columnName}` = ${r"#{"}${PrimaryColumn.propertyName}${r"}"}
        </where>
    </select>

    <select id="findList" resultMap="${EntityName}ResultMap">
        SELECT
        <include refid="${EntityName}Columns" />
        FROM `${TableName}` <include refid="${EntityName}Joins" />
        <where>
            <#-- AND ${TableName}.name LIKE concat('%',#{name},'%')-->
        </where>
    </select>

    <select id="findAllList" resultMap="${EntityName}ResultMap">
        SELECT
        <include refid="${EntityName}Columns" />
        FROM `${TableName}` <include refid="${EntityName}Joins" />
        <where>
        </where>
    </select>

    <insert id="insert" useGeneratedKeys="true" keyProperty="id">
        INSERT INTO `${TableName}`(
            ${InsertProperties}
        )
        VALUES (
            ${InsertValues}
        )
    </insert>

    <update id="update">
        UPDATE `${TableName}` SET
        ${UpdateProperties}
        WHERE `${PrimaryColumn.columnName}` = ${r"#{"}${PrimaryColumn.propertyName}${r"}"}
    </update>

    <update id="delete">
        DELETE FROM `${TableName}`
        WHERE `${PrimaryColumn.columnName}` = ${r"#{"}${PrimaryColumn.propertyName}${r"}"}
    </update>

</mapper>