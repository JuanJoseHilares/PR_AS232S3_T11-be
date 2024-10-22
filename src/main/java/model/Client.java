package model;

public class Client {

    private int client_id;
    private String paternal_surname;
    private String maternal_surname;
    private String names;
    private String sex;
    private String document_type;
    private String document_number;
    private String birth_date; // Cambiado a String para simplificar
    private String phone_number;
    private String whatsapp_number;
    private String reference_number;
    private String email;
    private String states;
    private int admin_id;

    public Client() {
    }

    public Client(int client_id, String paternal_surname, String maternal_surname, String names, String sex,
                  String document_type, String document_number, String birth_date, String phone_number,
                  String whatsapp_number, String reference_number, String email, String states, int admin_id) {
        this.client_id = client_id;
        this.paternal_surname = paternal_surname;
        this.maternal_surname = maternal_surname;
        this.names = names;
        this.sex = sex;
        this.document_type = document_type;
        this.document_number = document_number;
        this.birth_date = birth_date;
        this.phone_number = phone_number;
        this.whatsapp_number = whatsapp_number;
        this.reference_number = reference_number;
        this.email = email;
        this.states = states;
        this.admin_id = admin_id;
    }

    public int getClient_id() {
        return client_id;
    }

    public void setClient_id(int client_id) {
        this.client_id = client_id;
    }

    public String getPaternal_surname() {
        return paternal_surname;
    }

    public void setPaternal_surname(String paternal_surname) {
        this.paternal_surname = paternal_surname;
    }

    public String getMaternal_surname() {
        return maternal_surname;
    }

    public void setMaternal_surname(String maternal_surname) {
        this.maternal_surname = maternal_surname;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getDocument_type() {
        return document_type;
    }

    public void setDocument_type(String document_type) {
        this.document_type = document_type;
    }

    public String getDocument_number() {
        return document_number;
    }

    public void setDocument_number(String document_number) {
        this.document_number = document_number;
    }

    public String getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(String birth_date) {
        this.birth_date = birth_date;
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

    public String getStates() {
        return states;
    }

    public void setStates(String states) {
        this.states = states;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    @Override
    public String toString() {
        String data = "[client_id: " + this.client_id;
        data += ", paternal_surname: " + this.paternal_surname;
        data += ", maternal_surname: " + this.maternal_surname;
        data += ", names: " + this.names;
        data += ", sex: " + this.sex;
        data += ", document_type: " + this.document_type;
        data += ", document_number: " + this.document_number;
        data += ", birth_date: " + this.birth_date;
        data += ", phone_number: " + this.phone_number;
        data += ", whatsapp_number: " + this.whatsapp_number;
        data += ", reference_number: " + this.reference_number;
        data += ", email: " + this.email;
        data += ", states: " + this.states;
        data += ", admin_id: " + this.admin_id + "]";

        return data;
    }
}
