<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Dproducto
 *
 * @property $id
 * @property $denominacion
 * @property $preciocosto
 * @property $precioventa
 * @property $codigocup
 * @property $codigoproducto
 * @property $unidadmedida
 * @property $nunidadmedida_id
 * @property $dtipogiros_id
 * @property $created_at
 * @property $updated_at
 *
 * @property Ntipogiro $ntipogiro
 * @property Nunidadmedida $nunidadmedida
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
    protected $fillable = ['denominacion', 'preciocosto', 'codigocup', 'codigoproducto', 'precioventa', 'dtipogiros_id', 'nunidadmedida_id'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function ntipogiro()
    {
        return $this->belongsTo(\App\Models\Ntipogiro::class, 'dtipogiros_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function nunidadmedida()
    {
        return $this->belongsTo(\App\Models\Nunidadmedida::class, 'nunidadmedida_id', 'id');
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

    // /**
    //  * @return \Illuminate\Database\Eloquent\Relations\HasMany
    //  */
    // public function dproductosalidas()
    // {
    //     return $this->hasMany(\App\Models\Dproductosalida::class, 'id', 'dproducto_id');
    // }

    // /**
    //  * @return \Illuminate\Database\Eloquent\Relations\HasMany
    //  */
    // public function dventaproductos()
    // {
    //     return $this->hasMany(\App\Models\Dventaproducto::class, 'id', 'dproductos_id');
    // }

    //class Dproducto extends Model
//{
    // protected $fillable = [
    //     'denominacion', 'preciocosto', // otros campos relevantes
    // ];

    /**
     * The warehouse entries that belong to the product.
     */
    public function dentradaalmacens()
    {
        return $this->belongsToMany(Dentradaalmacen::class, 'dproductoentradas')
                    ->withPivot('cantidad', 'precio')
                    ->withTimestamps();
    }

    /**
     * The warehouse entries that belong to the product.
     */
    public function dproductosalidas()
    {
        return $this->belongsToMany(Dentradaalmacen::class, 'dproductosalidas')
                    ->withPivot('cantidad', 'precio')
                    ->withTimestamps();
    }

    public function dventaproductos()
    {
        return $this->belongsToMany(Dventaproducto::class, 'dventaproductos')
                    ->withPivot('cantidad', 'precio')
                    ->withTimestamps();
    }
//}


}
