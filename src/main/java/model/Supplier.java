package model;

public class Supplier {

    private int supplier_id;
    private String names;
    private String addres;
    private String city;
    private String phone_number;
    private String whatsapp_number;
    private String reference_number;
    private String email;
    private String admin_id;

    public Supplier() {
    }

    public Supplier(int supplier_id, String names, String addres, String city,
                    String phone_number, String whatsapp_number, String reference_number,
                    String email, String admin_id) {
        this.supplier_id = supplier_id;
        this.names = names;
        this.addres = addres;
        this.city = city;
        this.phone_number = phone_number;
        this.whatsapp_number = whatsapp_number;
        this.reference_number = reference_number;
        this.email = email;
        this.admin_id = admin_id;
    }

    public int getSupplier_id() {
        return supplier_id;
    }

    public void setSupplier_id(int supplier_id) {
        this.supplier_id = supplier_id;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public String getAddres() {
        return addres;
    }

    public void setAddres(String addres) {
        this.addres = addres;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getWhatsapp_number() {
        return whatsapp_number;
    }

    public void setWhatsapp_number(String whatsapp_number) {
        this.whatsapp_number = whatsapp_number;
    }

    public String getReference_number() {
        return reference_number;
    }

    public void setReference_number(String reference_number) {
        this.reference_number = reference_number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }

    @Override
    public String toString() {
        String data = "[supplier_id: " + this.supplier_id;
        data += ", names: " + this.names;
        data += ", address: " + this.addres;
        data += ", city: " + this.city;
        data += ", phone_number: " + this.phone_number;
        data += ", whatsapp_number: " + this.whatsapp_number;
        data += ", reference_number: " + this.reference_number;
        data += ", email: " + this.email;
        data += ", admin_id: " + this.admin_id + "]";
        return data;
    }
}