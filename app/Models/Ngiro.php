<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Ngiro
 *
 * @property $id
 * @property $denominacion
 * @property $created_at
 * @property $updated_at
 *
 * @property Ntipogiro[] $ntipogiros
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Ngiro extends Model
{
    
    protected $perPage = 20;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['denominacion'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function ntipogiros()
    {
        return $this->hasMany(\App\Models\Ntipogiro::class, 'id', 'ngiros_id');
    }
    
}
