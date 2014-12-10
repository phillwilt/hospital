require 'test_helper'

feature 'Create a new appointment' do
  scenario 'I want to create a new appointment for patient and physician' do
    # Given I want to create a new appointment
    visit appointments_path
    click_on 'New Appointment'

    # When I add an appointment
    select physicians(:one).name, from: 'Physician'
    select patients(:one).name, from: 'Patient'
    click_on 'Save'
    page.text.must_include 'Appointment was successfully created'

    # Then the patient and phsyician see the appointment
    visit appointments_path
    page.text.must_include physicians(:one).name
    page.text.must_include patients(:one).name

    visit patient_path(patients(:one))
    page.text.must_include physicians(:one).name

    visit physician_path(physicians(:one))
    page.text.must_include patients(:one).name
  end
end
