package entity;

public class Menu {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column menu.dish_id
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    private Integer dishId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column menu.dish_name
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    private String dishName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column menu.dish_pric
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    private Integer dishPric;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column menu.dish_discribe
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    private String dishDiscribe;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column menu.dish_class
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    private String dishClass;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column menu.dish_pic
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    private String dishPic;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column menu.restaur_id
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    private Integer restaurId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column menu.dish_id
     *
     * @return the value of menu.dish_id
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    public Integer getDishId() {
        return dishId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column menu.dish_id
     *
     * @param dishId the value for menu.dish_id
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    public void setDishId(Integer dishId) {
        this.dishId = dishId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column menu.dish_name
     *
     * @return the value of menu.dish_name
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    public String getDishName() {
        return dishName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column menu.dish_name
     *
     * @param dishName the value for menu.dish_name
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    public void setDishName(String dishName) {
        this.dishName = dishName == null ? null : dishName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column menu.dish_pric
     *
     * @return the value of menu.dish_pric
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    public Integer getDishPric() {
        return dishPric;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column menu.dish_pric
     *
     * @param dishPric the value for menu.dish_pric
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    public void setDishPric(Integer dishPric) {
        this.dishPric = dishPric;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column menu.dish_discribe
     *
     * @return the value of menu.dish_discribe
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    public String getDishDiscribe() {
        return dishDiscribe;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column menu.dish_discribe
     *
     * @param dishDiscribe the value for menu.dish_discribe
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    public void setDishDiscribe(String dishDiscribe) {
        this.dishDiscribe = dishDiscribe == null ? null : dishDiscribe.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column menu.dish_class
     *
     * @return the value of menu.dish_class
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    public String getDishClass() {
        return dishClass;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column menu.dish_class
     *
     * @param dishClass the value for menu.dish_class
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    public void setDishClass(String dishClass) {
        this.dishClass = dishClass == null ? null : dishClass.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column menu.dish_pic
     *
     * @return the value of menu.dish_pic
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    public String getDishPic() {
        return dishPic;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column menu.dish_pic
     *
     * @param dishPic the value for menu.dish_pic
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    public void setDishPic(String dishPic) {
        this.dishPic = dishPic == null ? null : dishPic.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column menu.restaur_id
     *
     * @return the value of menu.restaur_id
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    public Integer getRestaurId() {
        return restaurId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column menu.restaur_id
     *
     * @param restaurId the value for menu.restaur_id
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    public void setRestaurId(Integer restaurId) {
        this.restaurId = restaurId;
    }
}