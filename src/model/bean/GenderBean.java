/*
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 */
package model.bean;

public class GenderBean{
        private String name;
        private boolean enabled=false;
        private char id;

        /**
         * @param enabled the enabled to set
         */
        public void setEnabled(boolean enabled) {
            this.enabled = enabled;
        }

        /**
         * @param name
         * @param enabled
         */
        public GenderBean(String name, char id) {
            this.name = name;
            this.id=id;
        }

        public boolean isEnabled() {
            return enabled;
        }

        public String getName() {
            return name;
        }

        public char getId() {
            return id;
        }
    }
