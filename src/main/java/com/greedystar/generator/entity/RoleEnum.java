package com.greedystar.generator.entity;

import com.mysql.cj.util.StringUtils;

public class RoleEnum {

    public enum Rolg {

        /**
         * 类型
         */

        LEASE("1", "租赁"),
        SALES("0", "买卖");

        private String code;
        private String name;

        Rolg(String code, String name) {
            this.code = code;
            this.name = name;
        }

        public static String getNameByCode(String name) {
            if (StringUtils.isNullOrEmpty(name)) {
                return null;
            }
            for (Rolg rolg : Rolg.values()) {
                if (name.equals(rolg.name)) {
                    return rolg.code;
                }
            }
            return null;
        }

    }
}
