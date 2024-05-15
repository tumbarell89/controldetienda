<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Dproducto
 *
 * @property $id
 * @property $denominacion
 * @property $preciocosto
 * @property $codigocup
 * @property $codigoproducto
 * @property $unidadmedida
 * @property $dtipogiros_id
 * @property $created_at
 * @property $updated_at
 *
 * @property Ntipogiro $ntipogiro
 * @property Dalmaceninterno[] $dalmaceninternos
 * @property Dalmacenventa[] $dalmacenventas
 * @property Dproductoentrada[] $dproductoentradas
 * @property Dproductosalida[] $dproductosalidas
 * @property Dventaproducto[] $dventaproductos
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Dproducto extends Model
{
    
    protected $perPage = 20;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['denominacion', 'preciocosto', 'codigocup', 'codigoproducto', 'unidadmedida', 'dtipogiros_id'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function ntipogiro()
    {
        return $this->belongsTo(\App\Models\Ntipogiro::class, 'dtipogiros_id', 'id');
    }
    
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function dalmaceninternos()
    {
        return $this->hasMany(\App\Models\Dalmaceninterno::class, 'id', 'dproductos_id');
    }
    
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function dalmacenventas()
    {
        return $this->hasMany(\App\Models\Dalmacenventa::class, 'id', 'dproductos_id');
    }
    
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function dproductoentradas()
    {
        return $this->hasMany(\App\Models\Dproductoentrada::class, 'id', 'dproducto_id');
    }
    
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function dproductosalidas()
    {
        return $this->hasMany(\App\Models\Dproductosalida::class, 'id', 'dproducto_id');
    }
    
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function dventaproductos()
    {
        return $this->hasMany(\App\Models\Dventaproducto::class, 'id', 'dproductos_id');
    }
    
}
