<?php

namespace App\Rules;

use App\Enums\RoleType;
use App\Models\User;
use Closure;
use Illuminate\Contracts\Validation\ValidationRule;

class EmployeeUserExists implements ValidationRule
{
    /**
     * Run the validation rule.
     *
     * @param  \Closure(string): \Illuminate\Translation\PotentiallyTranslatedString  $fail
     */
    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        $user = User::findOrFail($value);

        if ($user->role->value !== RoleType::EMPLOYE) {
            $fail("L'utilisateur doit etre un employe");
        }
    }
}
