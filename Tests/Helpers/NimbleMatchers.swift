import Nimble


public func beVoid() -> Predicate<Void> {
  return Predicate.fromDeprecatedClosure { actualExpression, failureMessage in
    failureMessage.postfixMessage = "equal ()"

    let actualValue: Void? = try actualExpression.evaluate()
    switch actualValue {
    case ()?: return true
    default: return false
    }
  }
}

public func beSuccessful<T, E>() -> Predicate<Result<T, E>> {
  return Predicate.fromDeprecatedClosure { actual, failure in
    let result = try actual.evaluate()

    switch result {
    case .success?: return true
    default: return false
    }
  }
}
