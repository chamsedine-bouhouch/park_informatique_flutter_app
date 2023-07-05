<?php

namespace App\Http\Requests;

use App\Rules\EmployeeUserExists;
use Illuminate\Foundation\Http\FormRequest;

class StoreTicketRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'titre' => 'required',
            'lieu' => 'string',
            'service' => 'string',
            'description' => 'string',
            // 'employe_id' => ['required','exists:users,id',new EmployeeUserExists()],

        ];
    }
}
