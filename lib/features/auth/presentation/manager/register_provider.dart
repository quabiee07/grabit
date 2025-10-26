 import 'package:country_picker/country_picker.dart';
import 'package:grabit_mobile/core/presentation/manager/custom_provider.dart';
import 'package:grabit_mobile/core/presentation/utils/validation.dart';
import 'package:grabit_mobile/features/auth/presentation/manager/auth_state.dart';

class RegisterProvider extends CustomProvider {
   var state = AuthState();

  setToggle(bool value) {
    state.hasAgreedToTerms = value;
    _validateBasic();
  }

  setEmail(String email) {
    state.email = email.trim();
    state.emailError = email.validateEmail();
    _validateBasic();
  }

  setFirstName(String firstName) {
    state.firstName = firstName.trim();
    state.firstNameError = firstName.validateName();
    _validateBasic();
  }

  setLastName(String lastName) {
    state.lastName = lastName.trim();
    state.lastNameError = lastName.validateName();
    _validateBasic();
  }

  setPhone(String phone) {
    state.phone = phone.trim();
    state.phoneError = phone.validatePhone();
    _validateBasic();
  }

  setPassword(String password) {
    state.password = password.trim();
    state.passwordError = password.validatePassword();
    _validateBasic();
  }

  setConfirmPassword(String confirmPassword) {
    state.confirmPassword = confirmPassword.trim();
    state.confirmPasswordError =
        confirmPassword.validateRePassword(state.password);
    _validateBasic();
  }

  setCity(String city) {
    state.city = city.trim();
    state.cityError = city.validateName();
    _validateBasic();
  }

  setCountry(Country country) {
    state.country = country.name;
    state.countryCode = country.phoneCode;
    state.countryFlag = country.flagEmoji;
    state.countryError = country.name.validateName();
    _validateBasic();
  }

  setUsername(String username) {
    state.username = username.trim();
    state.usernameError = username.validateName();
    _validateBasic();
  }

  _validateBasic() {
    state.isBasic = [
      state.firstName.validateField() == null,
      state.lastName.validateField() == null,
      state.phone.validateField() == null,
      state.password.validateField() == null,
      state.confirmPassword.validateField() == null,
      state.city.validateField() == null,
      state.username.validateField() == null,
      state.email.validateField() == null,
      state.country.validateField() == null,
      state.hasAgreedToTerms == true,
    ].validate();
    notifyListeners();
  }
 }