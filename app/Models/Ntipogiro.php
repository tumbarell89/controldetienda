<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Ntipogiro
 *
 * @property $id
 * @property $denominacion
 * @property $created_at
 * @property $updated_at
 * @property $ngiros_id
 *
 * @property Ngiro $ngiro
 * @property Dproducto[] $dproductos
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Ntipogiro extends Model
{
    
    protected $perPage = 20;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['denominacion', 'ngiros_id'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function ngiro()
    {
        return $this->belongsTo(\App\Models\Ngiro::class, 'ngiros_id', 'id');
    }
    
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function dproductos()
    {
        return $this->hasMany(\App\Models\Dproducto::class, 'id', 'dtipogiros_id');
    }
    
}
